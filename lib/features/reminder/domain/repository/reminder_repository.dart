import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../models/reminder.dart';

abstract interface class ReminderRepository {
  Future<Either<Failure, List<Reminder>>> getForSubscription(
    int subscriptionId,
  );
  Future<Either<Failure, Reminder>> save(Reminder reminder);
  Future<Either<Failure, Unit>> delete(int reminderId);
  Future<Either<Failure, Unit>> deleteAllForSubscription(int subscriptionId);
}
