// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getSpendingSummary)
const getSpendingSummaryProvider = GetSpendingSummaryProvider._();

final class GetSpendingSummaryProvider
    extends
        $FunctionalProvider<
          GetSpendingSummary,
          GetSpendingSummary,
          GetSpendingSummary
        >
    with $Provider<GetSpendingSummary> {
  const GetSpendingSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getSpendingSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getSpendingSummaryHash();

  @$internal
  @override
  $ProviderElement<GetSpendingSummary> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetSpendingSummary create(Ref ref) {
    return getSpendingSummary(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetSpendingSummary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetSpendingSummary>(value),
    );
  }
}

String _$getSpendingSummaryHash() =>
    r'9242c04aaeef7aeffd319df31b77f96b2b89d88e';

/// Reactive dashboard data — rebuilds whenever subscriptions stream emits.
/// We watch [subscriptionsStreamProvider] to trigger invalidation on DB change,
/// then run the use case for the full aggregation.

@ProviderFor(dashboardSummary)
const dashboardSummaryProvider = DashboardSummaryProvider._();

/// Reactive dashboard data — rebuilds whenever subscriptions stream emits.
/// We watch [subscriptionsStreamProvider] to trigger invalidation on DB change,
/// then run the use case for the full aggregation.

final class DashboardSummaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<SpendingSummary>,
          SpendingSummary,
          FutureOr<SpendingSummary>
        >
    with $FutureModifier<SpendingSummary>, $FutureProvider<SpendingSummary> {
  /// Reactive dashboard data — rebuilds whenever subscriptions stream emits.
  /// We watch [subscriptionsStreamProvider] to trigger invalidation on DB change,
  /// then run the use case for the full aggregation.
  const DashboardSummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardSummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardSummaryHash();

  @$internal
  @override
  $FutureProviderElement<SpendingSummary> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SpendingSummary> create(Ref ref) {
    return dashboardSummary(ref);
  }
}

String _$dashboardSummaryHash() => r'aced3ec3a6848c3a4e94064b9815238c48dca05e';
