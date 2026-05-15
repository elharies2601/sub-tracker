// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$isarHash() => r'056115793ec12bf4d9bc06c832ad109adf22073a';

/// Isar instance — initialized in main.dart and overridden via ProviderScope
///
/// Copied from [isar].
@ProviderFor(isar)
final isarProvider = AutoDisposeProvider<Isar>.internal(
  isar,
  name: r'isarProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isarHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef IsarRef = AutoDisposeProviderRef<Isar>;
String _$subscriptionLocalDsHash() =>
    r'ad4bf921e0a2e0318496ecb9bbd522c710f02e1a';

/// See also [subscriptionLocalDs].
@ProviderFor(subscriptionLocalDs)
final subscriptionLocalDsProvider =
    AutoDisposeProvider<SubscriptionLocalDataSource>.internal(
  subscriptionLocalDs,
  name: r'subscriptionLocalDsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionLocalDsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionLocalDsRef
    = AutoDisposeProviderRef<SubscriptionLocalDataSource>;
String _$subscriptionRepositoryHash() =>
    r'3b994ce6d59256252259928011eec77c859a477d';

/// See also [subscriptionRepository].
@ProviderFor(subscriptionRepository)
final subscriptionRepositoryProvider =
    AutoDisposeProvider<SubscriptionRepository>.internal(
  subscriptionRepository,
  name: r'subscriptionRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionRepositoryRef
    = AutoDisposeProviderRef<SubscriptionRepository>;
String _$getAllSubscriptionsHash() =>
    r'45c574230576f0acbf8c7ed3f29922268937393a';

/// See also [getAllSubscriptions].
@ProviderFor(getAllSubscriptions)
final getAllSubscriptionsProvider =
    AutoDisposeProvider<GetAllSubscriptions>.internal(
  getAllSubscriptions,
  name: r'getAllSubscriptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getAllSubscriptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetAllSubscriptionsRef = AutoDisposeProviderRef<GetAllSubscriptions>;
String _$addSubscriptionHash() => r'4048d5652b086eb954d0b61169a277e4bb06b612';

/// See also [addSubscription].
@ProviderFor(addSubscription)
final addSubscriptionProvider = AutoDisposeProvider<AddSubscription>.internal(
  addSubscription,
  name: r'addSubscriptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$addSubscriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AddSubscriptionRef = AutoDisposeProviderRef<AddSubscription>;
String _$updateSubscriptionHash() =>
    r'4b51ef296ed01ccdb14f13b716ed4868d470446c';

/// See also [updateSubscription].
@ProviderFor(updateSubscription)
final updateSubscriptionProvider =
    AutoDisposeProvider<UpdateSubscription>.internal(
  updateSubscription,
  name: r'updateSubscriptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$updateSubscriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpdateSubscriptionRef = AutoDisposeProviderRef<UpdateSubscription>;
String _$deleteSubscriptionHash() =>
    r'247547fafd3ac6f455c3088742608cf5ec4c148d';

/// See also [deleteSubscription].
@ProviderFor(deleteSubscription)
final deleteSubscriptionProvider =
    AutoDisposeProvider<DeleteSubscription>.internal(
  deleteSubscription,
  name: r'deleteSubscriptionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$deleteSubscriptionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef DeleteSubscriptionRef = AutoDisposeProviderRef<DeleteSubscription>;
String _$confirmPaymentHash() => r'da298ce5ccf08625219f8416007eab175d00db8c';

/// See also [confirmPayment].
@ProviderFor(confirmPayment)
final confirmPaymentProvider = AutoDisposeProvider<ConfirmPayment>.internal(
  confirmPayment,
  name: r'confirmPaymentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$confirmPaymentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ConfirmPaymentRef = AutoDisposeProviderRef<ConfirmPayment>;
String _$getUpcomingSubscriptionsHash() =>
    r'571da4e6fb2b7e928e19c7fcdec1f3c9fd4aa1a4';

/// See also [getUpcomingSubscriptions].
@ProviderFor(getUpcomingSubscriptions)
final getUpcomingSubscriptionsProvider =
    AutoDisposeProvider<GetUpcomingSubscriptions>.internal(
  getUpcomingSubscriptions,
  name: r'getUpcomingSubscriptionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getUpcomingSubscriptionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetUpcomingSubscriptionsRef
    = AutoDisposeProviderRef<GetUpcomingSubscriptions>;
String _$subscriptionsStreamHash() =>
    r'fab05f647ccb664156ca3f2a4ae860c9594b19dc';

/// Reactive stream of all subscriptions — auto-updates on DB change
///
/// Copied from [subscriptionsStream].
@ProviderFor(subscriptionsStream)
final subscriptionsStreamProvider =
    AutoDisposeStreamProvider<List<Subscription>>.internal(
  subscriptionsStream,
  name: r'subscriptionsStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SubscriptionsStreamRef
    = AutoDisposeStreamProviderRef<List<Subscription>>;
String _$billingSummaryHash() => r'f41c3838560c302c4d0218b9d5ff5035c7533b80';

/// See also [billingSummary].
@ProviderFor(billingSummary)
final billingSummaryProvider =
    AutoDisposeProvider<AsyncValue<List<CycleSummary>>>.internal(
  billingSummary,
  name: r'billingSummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$billingSummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef BillingSummaryRef
    = AutoDisposeProviderRef<AsyncValue<List<CycleSummary>>>;
String _$monthlyTotalHash() => r'c9dadb3a412af01fcaabca40d40138539dd47454';

/// Derived: monthly total + dominant currency for display
/// Returns a Record (total, currency) — currency = most-used among active subs.
///
/// Copied from [monthlyTotal].
@ProviderFor(monthlyTotal)
final monthlyTotalProvider =
    AutoDisposeProvider<AsyncValue<(double, String)>>.internal(
  monthlyTotal,
  name: r'monthlyTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$monthlyTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef MonthlyTotalRef = AutoDisposeProviderRef<AsyncValue<(double, String)>>;
String _$upcomingBillsHash() => r'01786f09ac14c09ec99e674f6de7387eec0ad4fe';

/// Derived: upcoming bills in the next 7 days
///
/// Copied from [upcomingBills].
@ProviderFor(upcomingBills)
final upcomingBillsProvider =
    AutoDisposeProvider<AsyncValue<List<Subscription>>>.internal(
  upcomingBills,
  name: r'upcomingBillsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upcomingBillsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpcomingBillsRef
    = AutoDisposeProviderRef<AsyncValue<List<Subscription>>>;
String _$subscriptionNotifierHash() =>
    r'e92ff67db82d01b9a8a83d96ffd9fc5cb3f7e530';

/// See also [SubscriptionNotifier].
@ProviderFor(SubscriptionNotifier)
final subscriptionNotifierProvider = AutoDisposeNotifierProvider<
    SubscriptionNotifier, AsyncValue<void>>.internal(
  SubscriptionNotifier.new,
  name: r'subscriptionNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$subscriptionNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SubscriptionNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
