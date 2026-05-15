import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../entities/payment_history.dart';
import '../models/get_payment_history_params.dart';
import '../repositories/payment_history_repository.dart';

class GetPaymentHistory
    implements UseCase<List<PaymentHistory>, GetPaymentHistoryParams> {
  final PaymentHistoryRepository _repo;
  const GetPaymentHistory(this._repo);

  @override
  Future<Either<Failure, List<PaymentHistory>>> call(
    GetPaymentHistoryParams p,
  ) => _repo.getForSubscription(p.subscriptionId);
}
