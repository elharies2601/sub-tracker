// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$paymentHistoryLocalDsHash() =>
    r'a45a3176e4ffe6d0c4f4e7b4ad334a9ec64a280f';

/// See also [paymentHistoryLocalDs].
@ProviderFor(paymentHistoryLocalDs)
final paymentHistoryLocalDsProvider =
    AutoDisposeProvider<PaymentHistoryLocalDataSource>.internal(
  paymentHistoryLocalDs,
  name: r'paymentHistoryLocalDsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentHistoryLocalDsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentHistoryLocalDsRef
    = AutoDisposeProviderRef<PaymentHistoryLocalDataSource>;
String _$paymentHistoryRepositoryHash() =>
    r'd7ac6f0ecd3f0935e23dff228ff1a34bb2692c5b';

/// See also [paymentHistoryRepository].
@ProviderFor(paymentHistoryRepository)
final paymentHistoryRepositoryProvider =
    AutoDisposeProvider<PaymentHistoryRepository>.internal(
  paymentHistoryRepository,
  name: r'paymentHistoryRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentHistoryRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PaymentHistoryRepositoryRef
    = AutoDisposeProviderRef<PaymentHistoryRepository>;
String _$recordPaymentHash() => r'6042eededfa7d42dce982baf6f85b4d33be3812b';

/// See also [recordPayment].
@ProviderFor(recordPayment)
final recordPaymentProvider = AutoDisposeProvider<RecordPayment>.internal(
  recordPayment,
  name: r'recordPaymentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recordPaymentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RecordPaymentRef = AutoDisposeProviderRef<RecordPayment>;
String _$getPaymentHistoryHash() => r'f7a54e9d49c28047b5b1a73d62200e74fa4f6e5f';

/// See also [getPaymentHistory].
@ProviderFor(getPaymentHistory)
final getPaymentHistoryProvider =
    AutoDisposeProvider<GetPaymentHistory>.internal(
  getPaymentHistory,
  name: r'getPaymentHistoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getPaymentHistoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetPaymentHistoryRef = AutoDisposeProviderRef<GetPaymentHistory>;
String _$getMonthlySummaryHash() => r'3d1a4ed2030978e3d7369788e16631bce0391bf4';

/// See also [getMonthlySummary].
@ProviderFor(getMonthlySummary)
final getMonthlySummaryProvider =
    AutoDisposeProvider<GetMonthlySummary>.internal(
  getMonthlySummary,
  name: r'getMonthlySummaryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getMonthlySummaryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetMonthlySummaryRef = AutoDisposeProviderRef<GetMonthlySummary>;
String _$paymentHistoryForSubscriptionHash() =>
    r'9ad4cbd07a93b05ad286fbe55633fdbe9ed86920';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [paymentHistoryForSubscription].
@ProviderFor(paymentHistoryForSubscription)
const paymentHistoryForSubscriptionProvider =
    PaymentHistoryForSubscriptionFamily();

/// See also [paymentHistoryForSubscription].
class PaymentHistoryForSubscriptionFamily
    extends Family<AsyncValue<List<PaymentHistory>>> {
  /// See also [paymentHistoryForSubscription].
  const PaymentHistoryForSubscriptionFamily();

  /// See also [paymentHistoryForSubscription].
  PaymentHistoryForSubscriptionProvider call(
    int subscriptionId,
  ) {
    return PaymentHistoryForSubscriptionProvider(
      subscriptionId,
    );
  }

  @override
  PaymentHistoryForSubscriptionProvider getProviderOverride(
    covariant PaymentHistoryForSubscriptionProvider provider,
  ) {
    return call(
      provider.subscriptionId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'paymentHistoryForSubscriptionProvider';
}

/// See also [paymentHistoryForSubscription].
class PaymentHistoryForSubscriptionProvider
    extends AutoDisposeFutureProvider<List<PaymentHistory>> {
  /// See also [paymentHistoryForSubscription].
  PaymentHistoryForSubscriptionProvider(
    int subscriptionId,
  ) : this._internal(
          (ref) => paymentHistoryForSubscription(
            ref as PaymentHistoryForSubscriptionRef,
            subscriptionId,
          ),
          from: paymentHistoryForSubscriptionProvider,
          name: r'paymentHistoryForSubscriptionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$paymentHistoryForSubscriptionHash,
          dependencies: PaymentHistoryForSubscriptionFamily._dependencies,
          allTransitiveDependencies:
              PaymentHistoryForSubscriptionFamily._allTransitiveDependencies,
          subscriptionId: subscriptionId,
        );

  PaymentHistoryForSubscriptionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.subscriptionId,
  }) : super.internal();

  final int subscriptionId;

  @override
  Override overrideWith(
    FutureOr<List<PaymentHistory>> Function(
            PaymentHistoryForSubscriptionRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PaymentHistoryForSubscriptionProvider._internal(
        (ref) => create(ref as PaymentHistoryForSubscriptionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        subscriptionId: subscriptionId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PaymentHistory>> createElement() {
    return _PaymentHistoryForSubscriptionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentHistoryForSubscriptionProvider &&
        other.subscriptionId == subscriptionId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, subscriptionId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin PaymentHistoryForSubscriptionRef
    on AutoDisposeFutureProviderRef<List<PaymentHistory>> {
  /// The parameter `subscriptionId` of this provider.
  int get subscriptionId;
}

class _PaymentHistoryForSubscriptionProviderElement
    extends AutoDisposeFutureProviderElement<List<PaymentHistory>>
    with PaymentHistoryForSubscriptionRef {
  _PaymentHistoryForSubscriptionProviderElement(super.provider);

  @override
  int get subscriptionId =>
      (origin as PaymentHistoryForSubscriptionProvider).subscriptionId;
}

String _$paymentHistoryNotifierHash() =>
    r'511c88e6bcfc8deca114217ce186bc6da97b8acd';

/// See also [PaymentHistoryNotifier].
@ProviderFor(PaymentHistoryNotifier)
final paymentHistoryNotifierProvider = AutoDisposeNotifierProvider<
    PaymentHistoryNotifier, AsyncValue<void>>.internal(
  PaymentHistoryNotifier.new,
  name: r'paymentHistoryNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$paymentHistoryNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PaymentHistoryNotifier = AutoDisposeNotifier<AsyncValue<void>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
