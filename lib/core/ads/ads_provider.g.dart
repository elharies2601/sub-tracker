// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(shouldShowAds)
const shouldShowAdsProvider = ShouldShowAdsProvider._();

final class ShouldShowAdsProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const ShouldShowAdsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'shouldShowAdsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$shouldShowAdsHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return shouldShowAds(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$shouldShowAdsHash() => r'77570e7184a1a40d68b26c51db68020a1cf2d399';
