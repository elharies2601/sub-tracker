import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/base/usecase.dart';
import '../../../core/utils/notification_scheduler.dart';
import '../data/datasources/app_settings_local_data_source.dart';
import '../data/repository/app_settings_repository_impl.dart';
import '../domain/entities/app_settings.dart';
import '../domain/repository/app_settings_repository.dart';
import '../domain/usecases/save_app_settings.dart';
import '../domain/usecases/load_app_settings.dart';

import '../../subscription/presentation/providers/subscription_provider.dart';
import '../../subscription/data/models/subscription_model.dart';
import '../../subscription/data/models/payment_history_model.dart';
import '../../reminder/data/reminder_model.dart';

part 'settings_provider.g.dart';

// ══════════════════════════════════════════════════════════════════
//  INFRASTRUCTURE
// ══════════════════════════════════════════════════════════════════

@riverpod
AppSettingsLocalDataSource appSettingsLocalDs(Ref ref) =>
    AppSettingsLocalDataSourceImpl(ref.watch(isarProvider));

@riverpod
AppSettingsRepository appSettingsRepository(Ref ref) =>
    AppSettingsRepositoryImpl(ref.watch(appSettingsLocalDsProvider));

// ── Use case providers ─────────────────────────────────────────────

@riverpod
LoadAppSettings loadAppSettings(Ref ref) =>
    LoadAppSettings(ref.watch(appSettingsRepositoryProvider));

@riverpod
SaveAppSettings saveAppSettings(Ref ref) =>
    SaveAppSettings(ref.watch(appSettingsRepositoryProvider));

// ══════════════════════════════════════════════════════════════════
//  STATE  — loaded once, kept alive for the app lifetime
// ══════════════════════════════════════════════════════════════════

@riverpod
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  Future<AppSettings> build() async {
    final result = await ref
        .read(loadAppSettingsProvider)
        .call(const NoParams());
    return result.fold((f) => throw Exception(f.message), (s) => s);
  }

  // ── Individual setters — each triggers a DB save + side effects ──

  Future<void> setTheme(AppTheme theme) =>
      _update((s) => s.copyWith(theme: theme));

  Future<void> setDefaultCurrency(String currency) =>
      _update((s) => s.copyWith(defaultCurrency: currency));

  Future<void> setLanguage(String lang) =>
      _update((s) => s.copyWith(language: lang));

  Future<void> setBiometricLock(bool enabled) =>
      _update((s) => s.copyWith(biometricLock: enabled));

  Future<void> setNotificationsEnabled(bool enabled) async {
    await _update((s) => s.copyWith(notificationsEnabled: enabled));
    if (!enabled) {
      // Cancel all scheduled notifications immediately
      await NotificationScheduler.instance.cancelAll();
    } else {
      // Reschedule all active subscriptions
      await _rescheduleAll();
    }
  }

  Future<void> setReminderTime(TimeOfDay time) async {
    await _update(
      (s) => s.copyWith(reminderHour: time.hour, reminderMinute: time.minute),
    );
    // Reschedule all with the new time
    await _rescheduleAll();
  }

  Future<void> completeOnboarding({
    required String currency,
    required String language,
    required TimeOfDay reminderTime,
  }) async {
    await _update(
      (s) => s.copyWith(
        defaultCurrency: currency,
        language: language,
        reminderHour: reminderTime.hour,
        reminderMinute: reminderTime.minute,
        onboardingCompleted: true,
      ),
    );
  }

  Future<void> hideAdsFor24Hours() async {
    final expiry = DateTime.now().add(const Duration(hours: 24));
    await _update((s) => s.copyWith(adsHiddenUntil: expiry));
  }

  Future<void> clearAllData() async {
    final isar = ref.read(isarProvider);
    await isar.writeTxn(() async {
      await isar.subscriptionModels.clear();
      await isar.paymentHistoryModels.clear();
      await isar.reminderModels.clear();
    });

    await NotificationScheduler.instance.cancelAll();
  }

  // ── Core update helper ─────────────────────────────────────────

  Future<void> _update(AppSettings Function(AppSettings) transform) async {
    final current = state.asData?.value;
    if (current == null) return;

    final updated = transform(current);
    state = const AsyncLoading();

    final result = await ref.read(saveAppSettingsProvider).call(updated);
    state = result.fold(
      (f) => AsyncError(f.message, StackTrace.current),
      AsyncData.new,
    );
  }

  Future<void> _rescheduleAll() async {
    final settings = state.asData?.value;
    if (settings == null || !settings.notificationsEnabled) return;

    final repo = ref.read(subscriptionRepositoryProvider);
    final result = await repo.getAll();
    result.fold((_) {}, (subs) async {
      final active = subs.where((s) => s.isActive).toList();
      await NotificationScheduler.instance.rescheduleAll(
        active,
        reminderTime: settings.reminderTime,
      );
    });
  }
}

// ══════════════════════════════════════════════════════════════════
//  CONVENIENCE SELECTORS  (avoid watching the whole notifier)
// ══════════════════════════════════════════════════════════════════

/// Current ThemeMode — watched by MaterialApp.router to react to changes.
@riverpod
ThemeMode appThemeMode(Ref ref) {
  return ref
      .watch(appSettingsProvider)
      .asData?.value.themeMode ?? ThemeMode.system;
}

/// Current default currency — used by form pages as initial value.
@riverpod
String defaultCurrency(Ref ref) {
  return ref
      .watch(appSettingsProvider)
      .asData?.value.defaultCurrency ?? 'IDR';
}

/// Current Locale — watched by MaterialApp.router to react to language changes.
@riverpod
Locale appLocale(Ref ref) {
  final lang = ref
      .watch(appSettingsProvider)
      .asData?.value.language ?? 'id';
  return Locale(lang);
}

/// Whether onboarding has been completed — used by router redirect.
@riverpod
bool onboardingCompleted(Ref ref) {
  return ref
      .watch(appSettingsProvider)
      .asData?.value.onboardingCompleted ?? true;
}

/// Checks if device supports biometric authentication
@riverpod
Future<bool> biometricSupport(Ref ref) async {
  final auth = LocalAuthentication();
  final canCheckBiometrics = await auth.canCheckBiometrics;
  final isDeviceSupported = await auth.isDeviceSupported();
  return canCheckBiometrics || isDeviceSupported;
}

/// get app info
@riverpod
Future<PackageInfo> appInfo(Ref ref) => PackageInfo.fromPlatform();
