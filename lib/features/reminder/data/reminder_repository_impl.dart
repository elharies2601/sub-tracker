import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../domain/models/reminder.dart';
import '../domain/repository/reminder_repository.dart';
import 'reminder_local_ds.dart';
import 'reminder_model.dart';

class ReminderRepositoryImpl implements ReminderRepository {
  final ReminderLocalDataSource _ds;
  const ReminderRepositoryImpl(this._ds);

  @override
  Future<Either<Failure, List<Reminder>>> getForSubscription(
    int subscriptionId,
  ) => _guard(() async {
    final models = await _ds.getForSubscription(subscriptionId);
    return models.map((m) => m.toEntity()).toList();
  });

  @override
  Future<Either<Failure, Reminder>> save(Reminder reminder) => _guard(() async {
    final model = ReminderModel.fromEntity(reminder);
    final saved = await _ds.save(model);
    return saved.toEntity();
  });

  @override
  Future<Either<Failure, Unit>> delete(int reminderId) => _guard(() async {
    await _ds.delete(reminderId);
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> deleteAllForSubscription(int subscriptionId) =>
      _guard(() async {
        await _ds.deleteAllForSubscription(subscriptionId);
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
