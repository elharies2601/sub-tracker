import 'package:fpdart/fpdart.dart';
import 'package:sub_tracker_v2/core/error/failures.dart';
import 'package:sub_tracker_v2/features/subscription/domain/entities/payment_history.dart';
import 'package:sub_tracker_v2/features/subscription/domain/repositories/payment_history_repository.dart';

import 'datasources/payment_history_local_ds.dart';
import 'models/payment_history_model.dart';

class PaymentHistoryRepositoryImpl extends PaymentHistoryRepository {
  final PaymentHistoryLocalDataSource _ds;
  PaymentHistoryRepositoryImpl(this._ds);

  @override
  Future<Either<Failure, PaymentHistory>> add(PaymentHistory payment) =>
      _guard(() async {
        final model = PaymentHistoryModel.fromEntity(payment);
        final saved = await _ds.add(model);
        return saved.toEntity();
      });

  @override
  Future<Either<Failure, List<PaymentHistory>>> getForSubscription(
    int subscriptionId,
  ) => _guard(() async {
    final models = await _ds.getForSubscription(subscriptionId);
    return models.map((m) => m.toEntity()).toList();
  });

  @override
  Future<Either<Failure, Map<String, double>>> getMonthlySummary({
    int months = 6,
    required String currency,
  }) => _guard(() async {
    final now = DateTime.now();
    final from = DateTime(now.year, now.month - (months - 1), 1);
    final to = DateTime(now.year, now.month + 1, 0, 23, 59, 59);

    final records = await _ds.getInDateRange(from, to, currency);

    // Build "yyyy-MM" → total map
    final summary = <String, double>{};
    for (final r in records) {
      final key =
          '${r.paidAt.year}-${r.paidAt.month.toString().padLeft(2, '0')}';
      summary[key] = (summary[key] ?? 0) + r.amount;
    }
    return summary;
  });

  @override
  Future<Either<Failure, Unit>> deleteForSubscription(int subscriptionId) =>
      _guard(() async {
        await _ds.deleteForSubscription(subscriptionId);
        return unit;
      });

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() fn) async {
    try {
      return Right(await fn());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
