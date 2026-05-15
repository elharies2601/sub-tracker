import 'package:fpdart/fpdart.dart';

import 'package:sub_tracker_v2/core/error/failures.dart';

import '../../../../core/base/usecase.dart';
import '../entities/payment_history.dart';
import '../models/record_payment_params.dart';
import '../repositories/payment_history_repository.dart';
import '../repositories/subscription_repository.dart';

class RecordPayment implements UseCase<PaymentHistory, RecordPaymentParams> {
  final SubscriptionRepository _subRepo;
  final PaymentHistoryRepository _histRepo;

  const RecordPayment(this._subRepo, this._histRepo);

  @override
  Future<Either<Failure, PaymentHistory>> call(RecordPaymentParams p) async {
    // 1. Load the subscription
    final subResult = await _subRepo.getById(p.subscriptionId);
    if (subResult.isLeft()) return Left(subResult.getLeft().toNullable()!);
    final sub = subResult.getRight().toNullable()!;

    // 2. Save payment record
    final payment = PaymentHistory(
      id: 0,
      subscriptionId: sub.id,
      amount: sub.amount,
      currency: sub.currency,
      paidAt: DateTime.now(),
      notes: p.notes,
    );
    final histResult = await _histRepo.add(payment);
    if (histResult.isLeft()) return histResult;

    // 3. Advance nextBillingDate
    final updated = sub.copyWith(
      nextBillingDate: sub.computeNextBillingDate(),
      updatedAt: DateTime.now(),
    );
    await _subRepo.update(updated);

    return histResult;
  }
}
