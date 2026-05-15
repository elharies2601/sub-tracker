// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appSettingsLocalDs)
const appSettingsLocalDsProvider = AppSettingsLocalDsProvider._();

final class AppSettingsLocalDsProvider
    extends
        $FunctionalProvider<
          AppSettingsLocalDataSource,
          AppSettingsLocalDataSource,
          AppSettingsLocalDataSource
        >
    with $Provider<AppSettingsLocalDataSource> {
  const AppSettingsLocalDsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsLocalDsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsLocalDsHash();

  @$internal
  @override
  $ProviderElement<AppSettingsLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppSettingsLocalDataSource create(Ref ref) {
    return appSettingsLocalDs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSettingsLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSettingsLocalDataSource>(value),
    );
  }
}

String _$appSettingsLocalDsHash() =>
    r'80a7f07378676d9127c7269eb91cfbdf68518752';

@ProviderFor(appSettingsRepository)
const appSettingsRepositoryProvider = AppSettingsRepositoryProvider._();

final class AppSettingsRepositoryProvider
    extends
        $FunctionalProvider<
          AppSettingsRepository,
          AppSettingsRepository,
          AppSettingsRepository
        >
    with $Provider<AppSettingsRepository> {
  const AppSettingsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsRepositoryHash();

  @$internal
  @override
  $ProviderElement<AppSettingsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  AppSettingsRepository create(Ref ref) {
    return appSettingsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppSettingsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppSettingsRepository>(value),
    );
  }
}

String _$appSettingsRepositoryHash() =>
    r'351f7ac004d2908125edc54c37748b47de15e943';

@ProviderFor(loadAppSettings)
const loadAppSettingsProvider = LoadAppSettingsProvider._();

final class LoadAppSettingsProvider
    extends
        $FunctionalProvider<LoadAppSettings, LoadAppSettings, LoadAppSettings>
    with $Provider<LoadAppSettings> {
  const LoadAppSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadAppSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadAppSettingsHash();

  @$internal
  @override
  $ProviderElement<LoadAppSettings> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LoadAppSettings create(Ref ref) {
    return loadAppSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadAppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadAppSettings>(value),
    );
  }
}

String _$loadAppSettingsHash() => r'd5f991275f376bd56dcb7265e0ce2d0aa2e8c11c';

@ProviderFor(saveAppSettings)
const saveAppSettingsProvider = SaveAppSettingsProvider._();

final class SaveAppSettingsProvider
    extends
        $FunctionalProvider<SaveAppSettings, SaveAppSettings, SaveAppSettings>
    with $Provider<SaveAppSettings> {
  const SaveAppSettingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'saveAppSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$saveAppSettingsHash();

  @$internal
  @override
  $ProviderElement<SaveAppSettings> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SaveAppSettings create(Ref ref) {
    return saveAppSettings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SaveAppSettings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SaveAppSettings>(value),
    );
  }
}

String _$saveAppSettingsHash() => r'1392d1d4a6fe139a7b9a27ce37cedff5db85aa98';

@ProviderFor(AppSettingsNotifier)
const appSettingsProvider = AppSettingsNotifierProvider._();

final class AppSettingsNotifierProvider
    extends $AsyncNotifierProvider<AppSettingsNotifier, AppSettings> {
  const AppSettingsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appSettingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appSettingsNotifierHash();

  @$internal
  @override
  AppSettingsNotifier create() => AppSettingsNotifier();
}

String _$appSettingsNotifierHash() =>
    r'ef9f1a8d42f968b3e82315adc92c79610be188a0';

abstract class _$AppSettingsNotifier extends $AsyncNotifier<AppSettings> {
  FutureOr<AppSettings> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<AppSettings>, AppSettings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AppSettings>, AppSettings>,
              AsyncValue<AppSettings>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Current ThemeMode — watched by MaterialApp.router to react to changes.

@ProviderFor(appThemeMode)
const appThemeModeProvider = AppThemeModeProvider._();

/// Current ThemeMode — watched by MaterialApp.router to react to changes.

final class AppThemeModeProvider
    extends $FunctionalProvider<ThemeMode, ThemeMode, ThemeMode>
    with $Provider<ThemeMode> {
  /// Current ThemeMode — watched by MaterialApp.router to react to changes.
  const AppThemeModeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appThemeModeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appThemeModeHash();

  @$internal
  @override
  $ProviderElement<ThemeMode> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemeMode create(Ref ref) {
    return appThemeMode(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$appThemeModeHash() => r'da1e434684c8ee48775338a8a478ce8fa53d9a38';

/// Current default currency — used by form pages as initial value.

@ProviderFor(defaultCurrency)
const defaultCurrencyProvider = DefaultCurrencyProvider._();

/// Current default currency — used by form pages as initial value.

final class DefaultCurrencyProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  /// Current default currency — used by form pages as initial value.
  const DefaultCurrencyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'defaultCurrencyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$defaultCurrencyHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return defaultCurrency(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$defaultCurrencyHash() => r'c5d111fe9161cf4218f931f6a46be2a9b0806eb9';

/// Current Locale — watched by MaterialApp.router to react to language changes.

@ProviderFor(appLocale)
const appLocaleProvider = AppLocaleProvider._();

/// Current Locale — watched by MaterialApp.router to react to language changes.

final class AppLocaleProvider
    extends $FunctionalProvider<Locale, Locale, Locale>
    with $Provider<Locale> {
  /// Current Locale — watched by MaterialApp.router to react to language changes.
  const AppLocaleProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appLocaleProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appLocaleHash();

  @$internal
  @override
  $ProviderElement<Locale> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Locale create(Ref ref) {
    return appLocale(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Locale value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Locale>(value),
    );
  }
}

String _$appLocaleHash() => r'f50ca5b5f6a9098721bfba32958609707ed25c3c';

/// Whether onboarding has been completed — used by router redirect.

@ProviderFor(onboardingCompleted)
const onboardingCompletedProvider = OnboardingCompletedProvider._();

/// Whether onboarding has been completed — used by router redirect.

final class OnboardingCompletedProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Whether onboarding has been completed — used by router redirect.
  const OnboardingCompletedProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingCompletedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingCompletedHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return onboardingCompleted(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$onboardingCompletedHash() =>
    r'8a40b89dcfb2f1ba81f9fdc3a7294b6b55d9aaf0';

/// Checks if device supports biometric authentication

@ProviderFor(biometricSupport)
const biometricSupportProvider = BiometricSupportProvider._();

/// Checks if device supports biometric authentication

final class BiometricSupportProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  /// Checks if device supports biometric authentication
  const BiometricSupportProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'biometricSupportProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$biometricSupportHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return biometricSupport(ref);
  }
}

String _$biometricSupportHash() => r'3d69539fb5d12b93d9a571b47c08690f75764345';

/// get app info

@ProviderFor(appInfo)
const appInfoProvider = AppInfoProvider._();

/// get app info

final class AppInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PackageInfo>,
          PackageInfo,
          FutureOr<PackageInfo>
        >
    with $FutureModifier<PackageInfo>, $FutureProvider<PackageInfo> {
  /// get app info
  const AppInfoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appInfoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appInfoHash();

  @$internal
  @override
  $FutureProviderElement<PackageInfo> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PackageInfo> create(Ref ref) {
    return appInfo(ref);
  }
}

String _$appInfoHash() => r'82380d71fdbe012968a4ad4bba7297db2842d660';
