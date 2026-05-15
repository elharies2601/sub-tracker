// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getSpendingSummaryHash() =>
    r'9242c04aaeef7aeffd319df31b77f96b2b89d88e';

/// See also [getSpendingSummary].
@ProviderFor(getSpendingSummary)
final getSpendingSummaryProvider =
    AutoDisposeProvider<GetSpendingSummary>.internal(
  getSpendingSummary,
  name: r'getSpendingSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getSpendingSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetSpendingSummaryRef = AutoDisposeProviderRef<GetSpendingSummary>;
String _$dashboardSummaryHash() => r'aced3ec3a6848c3a4e94064b9815238c48dca05e';

/// Reactive dashboard data — rebuilds whenever subscriptions stream emits.
/// We watch [subscriptionsStreamProvider] to trigger invalidation on DB change,
/// then run the use case for the full aggregation.
///
/// Copied from [dashboardSummary].
@ProviderFor(dashboardSummary)
final dashboardSummaryProvider =
    AutoDisposeFutureProvider<SpendingSummary>.internal(
  dashboardSummary,
  name: r'dashboardSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$dashboardSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DashboardSummaryRef = AutoDisposeFutureProviderRef<SpendingSummary>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
