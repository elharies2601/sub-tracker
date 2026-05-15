import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/utils/notification_scheduler.dart';
import '../../../features/subscription/presentation/providers/subscription_provider.dart';
import '../data/reminder_local_ds.dart';
import '../data/reminder_repository_impl.dart';
import '../domain/models/cancel_reminders_params.dart';
import '../domain/models/reminder.dart';
import '../domain/models/schedule_reminders_params.dart';
import '../domain/repository/reminder_repository.dart';
import '../domain/usecases/cancel_reminders.dart';
import '../domain/usecases/reschedule_all.dart';
import '../domain/usecases/schedule_reminders.dart';

part 'reminder_provider.g.dart';

// ── Infrastructure ─────────────────────────────────────────────────

@riverpod
NotificationScheduler notificationScheduler(Ref ref) =>
    NotificationScheduler.instance;

@riverpod
ReminderLocalDataSource reminderLocalDs(Ref ref) =>
    ReminderLocalDataSourceImpl(ref.watch(isarProvider));

@riverpod
ReminderRepository reminderRepository(Ref ref) =>
    ReminderRepositoryImpl(ref.watch(reminderLocalDsProvider));

// ── Use case providers ─────────────────────────────────────────────

@riverpod
ScheduleReminders scheduleReminders(Ref ref) => ScheduleReminders(
  ref.watch(reminderRepositoryProvider),
  ref.watch(notificationSchedulerProvider),
);

@riverpod
CancelReminders cancelReminders(Ref ref) => CancelReminders(
  ref.watch(reminderRepositoryProvider),
  ref.watch(notificationSchedulerProvider),
);

@riverpod
RescheduleAll rescheduleAll(Ref ref) =>
    RescheduleAll(ref.watch(notificationSchedulerProvider));

// ── State: reminders for a given subscription ─────────────────────

@riverpod
Future<List<Reminder>> remindersForSubscription(
  Ref ref,
  int subscriptionId,
) async {
  final repo = ref.watch(reminderRepositoryProvider);
  final result = await repo.getForSubscription(subscriptionId);
  return result.getOrElse((_) => []);
}

// ══════════════════════════════════════════════════════════════════
//  NOTIFIER  — handles reminder CRUD + notification scheduling
// ══════════════════════════════════════════════════════════════════

@riverpod
class ReminderNotifier extends _$ReminderNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  /// Save reminder settings and reschedule notifications for [subscriptionId].
  Future<void> saveReminders({
    required int subscriptionId,
    required List<int> daysBefore,
    required TimeOfDay remindTime,
  }) async {
    state = const AsyncLoading();

    // Need the subscription entity to pass to the scheduler
    final subRepo = ref.read(subscriptionRepositoryProvider);
    final subResult = await subRepo.getById(subscriptionId);

    state = await subResult.fold(
      (f) async => AsyncError(f.message, StackTrace.current),
      (sub) async {
        final result = await ref
            .read(scheduleRemindersProvider)
            .call(
              ScheduleRemindersParams(
                subscription: sub,
                daysBefore: daysBefore,
                remindTime: remindTime,
              ),
            );
        return result.fold(
          (f) => AsyncError(f.message, StackTrace.current),
          (_) => const AsyncData(null),
        );
      },
    );

    // Invalidate the reminder list for this subscription
    ref.invalidate(remindersForSubscriptionProvider(subscriptionId));
  }

  /// Cancel all reminders for a subscription (call when deleting/pausing).
  Future<void> cancelForSubscription(int subscriptionId) async {
    state = const AsyncLoading();
    final result = await ref
        .read(cancelRemindersProvider)
        .call(CancelRemindersParams(subscriptionId));
    state = result.fold(
      (f) => AsyncError(f.message, StackTrace.current),
      (_) => const AsyncData(null),
    );
  }
}
