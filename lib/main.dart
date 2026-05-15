import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:startapp_sdk/startapp.dart';
import 'package:sub_tracker_v2/features/settings/data/models/app_settings_model.dart';
import 'package:sub_tracker_v2/features/subscription/data/models/payment_history_model.dart';
import 'package:sub_tracker_v2/l10n/app_localizations.dart';

import 'core/router/app_routes.dart';
import 'core/utils/notification_scheduler.dart';
import 'features/reminder/data/reminder_model.dart';
import 'features/subscription/data/datasources/subscription_local_ds.dart';
import 'features/subscription/data/models/subscription_model.dart';
import 'features/subscription/presentation/providers/subscription_provider.dart';
import 'features/settings/presentations/settings_provider.dart';
import 'core/auth/app_auth_provider.dart';
import 'core/auth/lock_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── [START.IO] INITIALIZATION ──────────────────────────────────────
  final startAppSdk = StartAppSdk();
  if (!kReleaseMode) {
    startAppSdk.setTestAdsEnabled(true);
  }
  // ───────────────────────────────────────────────────────────────────

  // ── 1. Open Isar ───────────────────────────────────────────────────
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    SubscriptionModelSchema,
    ReminderModelSchema,
    AppSettingsModelSchema,
    PaymentHistoryModelSchema,
  ], directory: dir.path);

  // ── 2. Init notification plugin ────────────────────────────────────
  await NotificationScheduler.instance.init();
  await NotificationScheduler.instance.requestPermissions();

  // ── 3. Reschedule ALL on startup ───────────────────────────────────
  // Android clears scheduled notifications on device reboot.
  // We reload all active subscriptions from DB and reschedule.
  await _rescheduleOnStartup(isar);

  // ── 4. Pre-load settings (avoid onboarding redirect flicker) ──────
  final container = ProviderContainer(
    overrides: [isarProvider.overrideWithValue(isar)],
  );
  // Await so onboardingCompleted is known before first frame
  await container.read(appSettingsProvider.future);

  // runApp(
  //   ProviderScope(
  //     overrides: [isarProvider.overrideWithValue(isar)],
  //     child: const SubTrackerApp(),
  //   ),
  // );

  // Firebase init
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const SubTrackerApp(),
    ),
  );
}

/// Runs before ProviderScope exists, so we read Isar directly here.
Future<void> _rescheduleOnStartup(Isar isar) async {
  try {
    final ds = SubscriptionLocalDataSourceImpl(isar);
    final models = await ds.getAll();
    final subscriptions = models.map((m) => m.toEntity()).toList();
    final active = subscriptions.where((s) => s.isActive).toList();
    await NotificationScheduler.instance.rescheduleAll(active);
  } catch (e) {
    // Silently fail — app still works without notifications
    debugPrint('Notification reschedule failed: $e');
  }
}

// ══════════════════════════════════════════════════════════════════
//  ROOT WIDGET
// ══════════════════════════════════════════════════════════════════

class SubTrackerApp extends ConsumerStatefulWidget {
  const SubTrackerApp({super.key});

  @override
  ConsumerState<SubTrackerApp> createState() => _SubTrackerAppState();
}

class _SubTrackerAppState extends ConsumerState<SubTrackerApp> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    // Wire notification tap → navigation
    NotificationNavigationEvent.instance.onTap = (subscriptionId) {
      final router = ref.read(appRouterProvider);
      router.push('/subscriptions/$subscriptionId');
    };

    // Listen to app lifecycle to lock the app when it goes to the background
    _listener = AppLifecycleListener(
      onStateChange: (state) {
        if (state == AppLifecycleState.paused ||
            state == AppLifecycleState.hidden) {
          ref.read(appAuthProvider.notifier).lock();
        }
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(appRouterProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    final locale = ref.watch(appLocaleProvider);

    return MaterialApp.router(
      title: 'SubTracker',
      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
        useMaterial3: true,
      ),
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        final isLocked = ref.watch(appAuthProvider);
        final onboardingDone = ref.watch(onboardingCompletedProvider);

        return Stack(
          children: [
            if (child != null) child,
            if (isLocked && onboardingDone) const LockScreenOverlay(),
          ],
        );
      },
    );
  }
}
