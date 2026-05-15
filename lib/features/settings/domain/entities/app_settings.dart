import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_settings.freezed.dart';

enum AppTheme { system, light, dark }

@freezed
abstract class AppSettings with _$AppSettings {
  const AppSettings._();

  const factory AppSettings({
    // Always id=1 — single-row table
    @Default(1) int id,

    // Currency
    @Default('IDR') String defaultCurrency,

    // Appearance
    @Default(AppTheme.system) AppTheme theme,

    // Notifications
    @Default(9) int reminderHour, // default 09:00
    @Default(0) int reminderMinute,
    @Default(true) bool notificationsEnabled,

    // Security
    @Default(false) bool biometricLock,

    // Misc
    @Default('id') String language, // BCP-47: 'id', 'en'
    // Onboarding
    @Default(false) bool onboardingCompleted,

    // Ads
    DateTime? adsHiddenUntil,

    required DateTime updatedAt,
  }) = _AppSettings;

  // ── Derived helpers ──────────────────────────────────────────────

  TimeOfDay get reminderTime =>
      TimeOfDay(hour: reminderHour, minute: reminderMinute);

  ThemeMode get themeMode => switch (theme) {
    AppTheme.system => ThemeMode.system,
    AppTheme.light => ThemeMode.light,
    AppTheme.dark => ThemeMode.dark,
  };

  /// Human-readable reminder time, e.g. "09:00"
  String get reminderTimeLabel {
    final h = reminderHour.toString().padLeft(2, '0');
    final m = reminderMinute.toString().padLeft(2, '0');
    return '$h:$m';
  }
}
