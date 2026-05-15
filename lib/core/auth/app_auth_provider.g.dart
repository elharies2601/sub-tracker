// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppAuthNotifier)
const appAuthProvider = AppAuthNotifierProvider._();

final class AppAuthNotifierProvider
    extends $NotifierProvider<AppAuthNotifier, bool> {
  const AppAuthNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appAuthProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appAuthNotifierHash();

  @$internal
  @override
  AppAuthNotifier create() => AppAuthNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$appAuthNotifierHash() => r'917597aa2654cc9be1cd4918c40c85ad4d9a5246';

abstract class _$AppAuthNotifier extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
