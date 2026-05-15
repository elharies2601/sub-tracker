import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reminder.freezed.dart';

/// Per-subscription reminder configuration stored in DB.
/// The actual notification is scheduled by [NotificationScheduler]
/// using these settings.
@freezed
class Reminder with _$Reminder {
  const factory Reminder({
    required int id,
    required int subscriptionId,
    required int daysBefore, // 0 = day-of, 1, 3, 7, etc.
    required TimeOfDay remindTime,
    @Default(true) bool isEnabled,
    required DateTime createdAt,
  }) = _Reminder;
}
