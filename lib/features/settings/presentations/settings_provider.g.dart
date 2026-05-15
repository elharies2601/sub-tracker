// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appSettingsLocalDsHash() =>
    r'80a7f07378676d9127c7269eb91cfbdf68518752';

/// See also [appSettingsLocalDs].
@ProviderFor(appSettingsLocalDs)
final appSettingsLocalDsProvider =
    AutoDisposeProvider<AppSettingsLocalDataSource>.internal(
  appSettingsLocalDs,
  name: r'appSettingsLocalDsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsLocalDsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppSettingsLocalDsRef
    = AutoDisposeProviderRef<AppSettingsLocalDataSource>;
String _$appSettingsRepositoryHash() =>
    r'351f7ac004d2908125edc54c37748b47de15e943';

/// See also [appSettingsRepository].
@ProviderFor(appSettingsRepository)
final appSettingsRepositoryProvider =
    AutoDisposeProvider<AppSettingsRepository>.internal(
  appSettingsRepository,
  name: r'appSettingsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppSettingsRepositoryRef
    = AutoDisposeProviderRef<AppSettingsRepository>;
String _$loadAppSettingsHash() => r'd5f991275f376bd56dcb7265e0ce2d0aa2e8c11c';

/// See also [loadAppSettings].
@ProviderFor(loadAppSettings)
final loadAppSettingsProvider = AutoDisposeProvider<LoadAppSettings>.internal(
  loadAppSettings,
  name: r'loadAppSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$loadAppSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LoadAppSettingsRef = AutoDisposeProviderRef<LoadAppSettings>;
String _$saveAppSettingsHash() => r'1392d1d4a6fe139a7b9a27ce37cedff5db85aa98';

/// See also [saveAppSettings].
@ProviderFor(saveAppSettings)
final saveAppSettingsProvider = AutoDisposeProvider<SaveAppSettings>.internal(
  saveAppSettings,
  name: r'saveAppSettingsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$saveAppSettingsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SaveAppSettingsRef = AutoDisposeProviderRef<SaveAppSettings>;
String _$appThemeModeHash() => r'df1cba10d8602d2e08b5b16ff0984b41ab3cdab6';

/// Current ThemeMode — watched by MaterialApp.router to react to changes.
///
/// Copied from [appThemeMode].
@ProviderFor(appThemeMode)
final appThemeModeProvider = AutoDisposeProvider<ThemeMode>.internal(
  appThemeMode,
  name: r'appThemeModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appThemeModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppThemeModeRef = AutoDisposeProviderRef<ThemeMode>;
String _$defaultCurrencyHash() => r'07ef2aee2a1eb924ac464773b5e7a719df0e2ce3';

/// Current default currency — used by form pages as initial value.
///
/// Copied from [defaultCurrency].
@ProviderFor(defaultCurrency)
final defaultCurrencyProvider = AutoDisposeProvider<String>.internal(
  defaultCurrency,
  name: r'defaultCurrencyProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$defaultCurrencyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DefaultCurrencyRef = AutoDisposeProviderRef<String>;
String _$appLocaleHash() => r'2d5995481ef39bc0017b64d32192e8f607bd051a';

/// Current Locale — watched by MaterialApp.router to react to language changes.
///
/// Copied from [appLocale].
@ProviderFor(appLocale)
final appLocaleProvider = AutoDisposeProvider<Locale>.internal(
  appLocale,
  name: r'appLocaleProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appLocaleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppLocaleRef = AutoDisposeProviderRef<Locale>;
String _$onboardingCompletedHash() =>
    r'adee8156e1791389ff7857d5a454f790e7b67747';

/// Whether onboarding has been completed — used by router redirect.
///
/// Copied from [onboardingCompleted].
@ProviderFor(onboardingCompleted)
final onboardingCompletedProvider = AutoDisposeProvider<bool>.internal(
  onboardingCompleted,
  name: r'onboardingCompletedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$onboardingCompletedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OnboardingCompletedRef = AutoDisposeProviderRef<bool>;
String _$biometricSupportHash() => r'3d69539fb5d12b93d9a571b47c08690f75764345';

/// Checks if device supports biometric authentication
///
/// Copied from [biometricSupport].
@ProviderFor(biometricSupport)
final biometricSupportProvider = AutoDisposeFutureProvider<bool>.internal(
  biometricSupport,
  name: r'biometricSupportProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$biometricSupportHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BiometricSupportRef = AutoDisposeFutureProviderRef<bool>;
String _$appInfoHash() => r'82380d71fdbe012968a4ad4bba7297db2842d660';

/// get app info
///
/// Copied from [appInfo].
@ProviderFor(appInfo)
final appInfoProvider = AutoDisposeFutureProvider<PackageInfo>.internal(
  appInfo,
  name: r'appInfoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appInfoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AppInfoRef = AutoDisposeFutureProviderRef<PackageInfo>;
String _$appSettingsNotifierHash() =>
    r'ef9f1a8d42f968b3e82315adc92c79610be188a0';

/// See also [AppSettingsNotifier].
@ProviderFor(AppSettingsNotifier)
final appSettingsNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppSettingsNotifier, AppSettings>.internal(
  AppSettingsNotifier.new,
  name: r'appSettingsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$appSettingsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AppSettingsNotifier = AutoDisposeAsyncNotifier<AppSettings>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
