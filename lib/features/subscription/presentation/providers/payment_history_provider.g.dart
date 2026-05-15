// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(paymentHistoryLocalDs)
const paymentHistoryLocalDsProvider = PaymentHistoryLocalDsProvider._();

final class PaymentHistoryLocalDsProvider
    extends
        $FunctionalProvider<
          PaymentHistoryLocalDataSource,
          PaymentHistoryLocalDataSource,
          PaymentHistoryLocalDataSource
        >
    with $Provider<PaymentHistoryLocalDataSource> {
  const PaymentHistoryLocalDsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentHistoryLocalDsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentHistoryLocalDsHash();

  @$internal
  @override
  $ProviderElement<PaymentHistoryLocalDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PaymentHistoryLocalDataSource create(Ref ref) {
    return paymentHistoryLocalDs(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentHistoryLocalDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentHistoryLocalDataSource>(
        value,
      ),
    );
  }
}

String _$paymentHistoryLocalDsHash() =>
    r'a45a3176e4ffe6d0c4f4e7b4ad334a9ec64a280f';

@ProviderFor(paymentHistoryRepository)
const paymentHistoryRepositoryProvider = PaymentHistoryRepositoryProvider._();

final class PaymentHistoryRepositoryProvider
    extends
        $FunctionalProvider<
          PaymentHistoryRepository,
          PaymentHistoryRepository,
          PaymentHistoryRepository
        >
    with $Provider<PaymentHistoryRepository> {
  const PaymentHistoryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentHistoryRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentHistoryRepositoryHash();

  @$internal
  @override
  $ProviderElement<PaymentHistoryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  PaymentHistoryRepository create(Ref ref) {
    return paymentHistoryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PaymentHistoryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PaymentHistoryRepository>(value),
    );
  }
}

String _$paymentHistoryRepositoryHash() =>
    r'd7ac6f0ecd3f0935e23dff228ff1a34bb2692c5b';

@ProviderFor(recordPayment)
const recordPaymentProvider = RecordPaymentProvider._();

final class RecordPaymentProvider
    extends $FunctionalProvider<RecordPayment, RecordPayment, RecordPayment>
    with $Provider<RecordPayment> {
  const RecordPaymentProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'recordPaymentProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$recordPaymentHash();

  @$internal
  @override
  $ProviderElement<RecordPayment> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RecordPayment create(Ref ref) {
    return recordPayment(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RecordPayment value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RecordPayment>(value),
    );
  }
}

String _$recordPaymentHash() => r'6042eededfa7d42dce982baf6f85b4d33be3812b';

@ProviderFor(getPaymentHistory)
const getPaymentHistoryProvider = GetPaymentHistoryProvider._();

final class GetPaymentHistoryProvider
    extends
        $FunctionalProvider<
          GetPaymentHistory,
          GetPaymentHistory,
          GetPaymentHistory
        >
    with $Provider<GetPaymentHistory> {
  const GetPaymentHistoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getPaymentHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getPaymentHistoryHash();

  @$internal
  @override
  $ProviderElement<GetPaymentHistory> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetPaymentHistory create(Ref ref) {
    return getPaymentHistory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetPaymentHistory value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetPaymentHistory>(value),
    );
  }
}

String _$getPaymentHistoryHash() => r'f7a54e9d49c28047b5b1a73d62200e74fa4f6e5f';

@ProviderFor(getMonthlySummary)
const getMonthlySummaryProvider = GetMonthlySummaryProvider._();

final class GetMonthlySummaryProvider
    extends
        $FunctionalProvider<
          GetMonthlySummary,
          GetMonthlySummary,
          GetMonthlySummary
        >
    with $Provider<GetMonthlySummary> {
  const GetMonthlySummaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'getMonthlySummaryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$getMonthlySummaryHash();

  @$internal
  @override
  $ProviderElement<GetMonthlySummary> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GetMonthlySummary create(Ref ref) {
    return getMonthlySummary(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetMonthlySummary value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetMonthlySummary>(value),
    );
  }
}

String _$getMonthlySummaryHash() => r'3d1a4ed2030978e3d7369788e16631bce0391bf4';

@ProviderFor(paymentHistoryForSubscription)
const paymentHistoryForSubscriptionProvider =
    PaymentHistoryForSubscriptionFamily._();

final class PaymentHistoryForSubscriptionProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PaymentHistory>>,
          List<PaymentHistory>,
          FutureOr<List<PaymentHistory>>
        >
    with
        $FutureModifier<List<PaymentHistory>>,
        $FutureProvider<List<PaymentHistory>> {
  const PaymentHistoryForSubscriptionProvider._({
    required PaymentHistoryForSubscriptionFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'paymentHistoryForSubscriptionProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$paymentHistoryForSubscriptionHash();

  @override
  String toString() {
    return r'paymentHistoryForSubscriptionProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<PaymentHistory>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PaymentHistory>> create(Ref ref) {
    final argument = this.argument as int;
    return paymentHistoryForSubscription(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PaymentHistoryForSubscriptionProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$paymentHistoryForSubscriptionHash() =>
    r'9ad4cbd07a93b05ad286fbe55633fdbe9ed86920';

final class PaymentHistoryForSubscriptionFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<PaymentHistory>>, int> {
  const PaymentHistoryForSubscriptionFamily._()
    : super(
        retry: null,
        name: r'paymentHistoryForSubscriptionProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PaymentHistoryForSubscriptionProvider call(int subscriptionId) =>
      PaymentHistoryForSubscriptionProvider._(
        argument: subscriptionId,
        from: this,
      );

  @override
  String toString() => r'paymentHistoryForSubscriptionProvider';
}

@ProviderFor(PaymentHistoryNotifier)
const paymentHistoryProvider = PaymentHistoryNotifierProvider._();

final class PaymentHistoryNotifierProvider
    extends $NotifierProvider<PaymentHistoryNotifier, AsyncValue<void>> {
  const PaymentHistoryNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'paymentHistoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$paymentHistoryNotifierHash();

  @$internal
  @override
  PaymentHistoryNotifier create() => PaymentHistoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<void> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<void>>(value),
    );
  }
}

String _$paymentHistoryNotifierHash() =>
    r'511c88e6bcfc8deca114217ce186bc6da97b8acd';

abstract class _$PaymentHistoryNotifier extends $Notifier<AsyncValue<void>> {
  AsyncValue<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<void>, AsyncValue<void>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, AsyncValue<void>>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
