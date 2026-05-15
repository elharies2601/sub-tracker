import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/payment_history.dart';

abstract class PaymentHistoryRepository {
  Future<Either<Failure, PaymentHistory>> add(PaymentHistory payment);
  Future<Either<Failure, List<PaymentHistory>>> getForSubscription(
    int subscriptionId,
  );
  Future<Either<Failure, Map<String, double>>> getMonthlySummary({
    int months = 6,
    required String currency,
  });
  Future<Either<Failure, Unit>> deleteForSubscription(int subscriptionId);
}
