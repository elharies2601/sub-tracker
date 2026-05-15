import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../models/get_monthly_summary_params.dart';
import '../repositories/payment_history_repository.dart';

class GetMonthlySummary
    implements UseCase<Map<String, double>, GetMonthlySummaryParams> {
  final PaymentHistoryRepository _repo;
  const GetMonthlySummary(this._repo);

  @override
  Future<Either<Failure, Map<String, double>>> call(
    GetMonthlySummaryParams p,
  ) => _repo.getMonthlySummary(months: p.months, currency: p.currency);
}
