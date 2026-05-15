import 'package:isar/isar.dart';

import '../../domain/entities/app_settings.dart' as entity;

part 'app_settings_model.g.dart';

@collection
class AppSettingsModel {
  /// Always 1 — single-row table.
  Id id = 1;

  late String defaultCurrency;

  @Enumerated(EnumType.name)
  late AppThemeDb theme;

  late int reminderHour;
  late int reminderMinute;
  late bool notificationsEnabled;
  late bool biometricLock;
  late String language;
  late bool onboardingCompleted;
  DateTime? adsHiddenUntil;
  late DateTime updatedAt;

  entity.AppSettings toEntity() => entity.AppSettings(
    id: id,
    defaultCurrency: defaultCurrency,
    theme: theme.toEntity(),
    reminderHour: reminderHour,
    reminderMinute: reminderMinute,
    notificationsEnabled: notificationsEnabled,
    biometricLock: biometricLock,
    language: language,
    onboardingCompleted: onboardingCompleted,
    adsHiddenUntil: adsHiddenUntil,
    updatedAt: updatedAt,
  );

  static AppSettingsModel fromEntity(entity.AppSettings e) => AppSettingsModel()
    ..id = e.id
    ..defaultCurrency = e.defaultCurrency
    ..theme = AppThemeDbX.fromEntity(e.theme)
    ..reminderHour = e.reminderHour
    ..reminderMinute = e.reminderMinute
    ..notificationsEnabled = e.notificationsEnabled
    ..biometricLock = e.biometricLock
    ..language = e.language
    ..onboardingCompleted = e.onboardingCompleted
    ..adsHiddenUntil = e.adsHiddenUntil
    ..updatedAt = e.updatedAt;

  /// Default row used when the table is empty (first launch).
  static AppSettingsModel defaults() => AppSettingsModel()
    ..id = 1
    ..defaultCurrency = 'IDR'
    ..theme = AppThemeDb.system
    ..reminderHour = 9
    ..reminderMinute = 0
    ..notificationsEnabled = true
    ..biometricLock = false
    ..language = 'id'
    ..onboardingCompleted = false
    ..adsHiddenUntil = null
    ..updatedAt = DateTime.now();
}

// ── Local enum for Isar ───────────────────────────────────────────

enum AppThemeDb { system, light, dark }

extension AppThemeDbX on AppThemeDb {
  entity.AppTheme toEntity() => switch (this) {
    AppThemeDb.system => entity.AppTheme.system,
    AppThemeDb.light => entity.AppTheme.light,
    AppThemeDb.dark => entity.AppTheme.dark,
  };

  static AppThemeDb fromEntity(entity.AppTheme e) => switch (e) {
    entity.AppTheme.system => AppThemeDb.system,
    entity.AppTheme.light => AppThemeDb.light,
    entity.AppTheme.dark => AppThemeDb.dark,
  };
}
