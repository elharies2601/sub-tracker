import 'package:fpdart/fpdart.dart';

import '../../../../core/base/usecase.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/utils/notification_scheduler.dart';
import '../models/reschedule_all_params.dart';

class RescheduleAll implements UseCase<Unit, RescheduleAllParams> {
  final NotificationScheduler _scheduler;
  const RescheduleAll(this._scheduler);

  @override
  Future<Either<Failure, Unit>> call(RescheduleAllParams p) async {
    try {
      await _scheduler.rescheduleAll(
        p.subscriptions,
        reminderTime: p.remindTime,
      );
      return Right(unit);
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }
}
