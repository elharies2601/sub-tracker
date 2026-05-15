import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sub_tracker_v2/features/calendar/presentation/pages/calendar_page.dart';

import '../../features/settings/presentations/settings_provider.dart';
import '../../features/subscription/domain/entities/subscription.dart';
import '../../features/reminder/presentation/reminder_settings_page.dart';
import '../../features/subscription/presentation/pages/subscription_detail_page.dart';
import '../../features/subscription/presentation/pages/subscription_form_page.dart';
import '../../features/subscription/presentation/pages/subscription_list_page.dart';
import '../../features/dashboard/presentation/dashboard_page.dart';
import '../../features/dashboard/presentation/widgets/app_shell.dart';
import '../../features/settings/presentations/settings_page.dart';
import '../../features/settings/presentations/onboarding_page.dart';

part 'app_routes.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  // Watch so router rebuilds when onboarding status changes
  final onboardingDone = ref.watch(onboardingCompletedProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final goingToOnboarding = state.matchedLocation == '/onboarding';

      if (!onboardingDone && !goingToOnboarding) {
        return '/onboarding';
      }
      if (onboardingDone && goingToOnboarding) {
        return '/';
      }
      return null; // no redirect needed
    },
    routes: [
      // ── Onboarding — outside shell (no bottom nav) ─────────────
      GoRoute(path: '/onboarding', builder: (_, __) => const OnboardingPage()),
      // ── Shell: pages with bottom nav bar ──────────────────────
      ShellRoute(
        builder: (_, __, child) => AppShell(child: child),
        routes: [
          GoRoute(path: '/', builder: (_, __) => const SubscriptionListPage()),
          GoRoute(path: '/calendar', builder: (_, __) => const CalendarPage()),
          GoRoute(
            path: '/dashboard',
            builder: (_, __) => const DashboardPage(),
          ),
          GoRoute(path: '/settings', builder: (_, __) => const SettingsPage()),
        ],
      ),
      GoRoute(
        path: '/subscriptions/add',
        builder: (_, __) => const SubscriptionFormPage(),
      ),
      GoRoute(
        path: '/subscriptions/:id',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          return SubscriptionDetailPage(subscriptionId: id);
        },
      ),
      GoRoute(
        path: '/subs/edit',
        builder: (_, state) {
          final sub = state.extra as Subscription?;
          return SubscriptionFormPage(existing: sub);
        },
      ),
      GoRoute(
        path: '/subscriptions/:id/reminders',
        builder: (_, state) {
          final id = int.parse(state.pathParameters['id']!);
          final name = state.extra as String? ?? '';
          return ReminderSettingsPage(
            subscriptionId: id,
            subscriptionName: name,
          );
        },
      ),
    ],
  );
}
