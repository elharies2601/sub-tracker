import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/datasources/payment_history_local_ds.dart';
import '../../data/payment_history_repository_impl.dart';
import '../../domain/entities/payment_history.dart';
import '../../domain/models/get_payment_history_params.dart';
import '../../domain/models/record_payment_params.dart';
import '../../domain/repositories/payment_history_repository.dart';
import '../../domain/usecases/get_monthly_summary.dart';
import '../../domain/usecases/get_payment_history.dart';
import '../../domain/usecases/record_payment.dart';
import 'subscription_provider.dart';

part 'payment_history_provider.g.dart';

// ── Infrastructure ─────────────────────────────────────────────────

@riverpod
PaymentHistoryLocalDataSource paymentHistoryLocalDs(Ref ref) =>
    PaymentHistoryLocalDataSourceImpl(ref.watch(isarProvider));

@riverpod
PaymentHistoryRepository paymentHistoryRepository(Ref ref) =>
    PaymentHistoryRepositoryImpl(ref.watch(paymentHistoryLocalDsProvider));

// ── Use case providers ─────────────────────────────────────────────

@riverpod
RecordPayment recordPayment(Ref ref) => RecordPayment(
  ref.watch(subscriptionRepositoryProvider),
  ref.watch(paymentHistoryRepositoryProvider),
);

@riverpod
GetPaymentHistory getPaymentHistory(Ref ref) =>
    GetPaymentHistory(ref.watch(paymentHistoryRepositoryProvider));

@riverpod
GetMonthlySummary getMonthlySummary(Ref ref) =>
    GetMonthlySummary(ref.watch(paymentHistoryRepositoryProvider));

// ── State: history for a given subscription ────────────────────────

@riverpod
Future<List<PaymentHistory>> paymentHistoryForSubscription(
  Ref ref,
  int subscriptionId,
) async {
  final result = await ref
      .watch(getPaymentHistoryProvider)
      .call(GetPaymentHistoryParams(subscriptionId));
  return result.getOrElse((_) => []);
}

// ══════════════════════════════════════════════════════════════════
//  NOTIFIER
// ══════════════════════════════════════════════════════════════════

@riverpod
class PaymentHistoryNotifier extends _$PaymentHistoryNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<bool> recordPayment(int subscriptionId, {String? notes}) async {
    state = const AsyncLoading();
    final result = await ref
        .read(recordPaymentProvider)
        .call(
          RecordPaymentParams(subscriptionId: subscriptionId, notes: notes),
        );
    state = result.fold(
      (f) => AsyncError(f.message, StackTrace.current),
      (_) => const AsyncData(null),
    );
    if (result.isRight()) {
      // Invalidate history list so UI refreshes
      ref.invalidate(paymentHistoryForSubscriptionProvider(subscriptionId));
    }
    return result.isRight();
  }

  Future<bool> deletePayment({required int subscriptionId}) async {
    state = const AsyncLoading();

    final result = await ref
        .read(paymentHistoryRepositoryProvider)
        .deleteForSubscription(subscriptionId);

    state = result.fold(
      (f) => AsyncError(f.message, StackTrace.current),
      (_) => const AsyncData(null),
    );

    if (result.isRight()) {
      ref.invalidate(paymentHistoryForSubscriptionProvider(subscriptionId));
    }

    return result.isRight();
  }
}
