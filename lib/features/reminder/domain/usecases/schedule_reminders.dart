import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../models/reminder.dart';
import '../models/schedule_reminders_params.dart';
import '../repository/reminder_repository.dart';
import '../../../../core/utils/notification_scheduler.dart';

class ScheduleReminders
    implements UseCase<List<Reminder>, ScheduleRemindersParams> {
  final ReminderRepository _reminderRepo;
  final NotificationScheduler _scheduler;

  const ScheduleReminders(this._reminderRepo, this._scheduler);

  @override
  Future<Either<Failure, List<Reminder>>> call(
    ScheduleRemindersParams p,
  ) async {
    try {
      // 1. Wipe old reminder configs for this subscription
      await _reminderRepo.deleteAllForSubscription(p.subscription.id);

      // 2. Save new reminder configs to DB
      final saved = <Reminder>[];
      final now = DateTime.now();
      for (final days in p.daysBefore) {
        final result = await _reminderRepo.save(
          Reminder(
            id: 0,
            subscriptionId: p.subscription.id,
            daysBefore: days,
            remindTime: p.remindTime,
            isEnabled: true,
            createdAt: now,
          ),
        );
        result.fold((_) {}, saved.add);
      }

      // 3. Schedule actual notifications
      await _scheduler.scheduleForSubscription(
        p.subscription,
        daysBefore: p.daysBefore,
        reminderTime: p.remindTime,
      );

      return Right(saved);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
