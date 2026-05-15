import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/base/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';
import '../models/confirm_payment_params.dart';

class ConfirmPayment implements UseCase<Subscription, ConfirmPaymentParams> {
  final SubscriptionRepository _repo;
  const ConfirmPayment(this._repo);

  @override
  Future<Either<Failure, Subscription>> call(ConfirmPaymentParams p) async {
    final result = await _repo.getById(p.subscriptionId);
    return result.fold((failure) => Left(failure), (sub) {
      final updated = sub.copyWith(
        nextBillingDate: sub.computeNextBillingDate(),
        updatedAt: DateTime.now(),
      );
      return _repo.update(updated); // return Future<Either> langsung
    });
  }
}
