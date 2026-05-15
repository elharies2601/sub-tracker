import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/notification_scheduler.dart';
import '../models/cancel_reminders_params.dart';
import '../repository/reminder_repository.dart';

class CancelReminders implements UseCase<Unit, CancelRemindersParams> {
  final ReminderRepository _reminderRepo;
  final NotificationScheduler _scheduler;

  const CancelReminders(this._reminderRepo, this._scheduler);

  @override
  Future<Either<Failure, Unit>> call(CancelRemindersParams p) async {
    try {
      // Remove DB configs
      await _reminderRepo.deleteAllForSubscription(p.subscriptionId);

      // Cancel system notifications
      await _scheduler.cancelForSubscription(p.subscriptionId);

      return Right(unit);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
