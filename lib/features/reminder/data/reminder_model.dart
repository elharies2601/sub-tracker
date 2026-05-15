import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../domain/models/reminder.dart' as entity;

part 'reminder_model.g.dart';

@collection
class ReminderModel {
  Id id = Isar.autoIncrement;

  late int subscriptionId;
  late int daysBefore;

  // TimeOfDay stored as two ints (Isar can't serialize TimeOfDay directly)
  late int remindHour;
  late int remindMinute;

  late bool isEnabled;
  late DateTime createdAt;

  entity.Reminder toEntity() => entity.Reminder(
    id: id,
    subscriptionId: subscriptionId,
    daysBefore: daysBefore,
    remindTime: TimeOfDay(hour: remindHour, minute: remindMinute),
    isEnabled: isEnabled,
    createdAt: createdAt,
  );

  static ReminderModel fromEntity(entity.Reminder e) => ReminderModel()
    ..id = e.id == 0 ? Isar.autoIncrement : e.id
    ..subscriptionId = e.subscriptionId
    ..daysBefore = e.daysBefore
    ..remindHour = e.remindTime.hour
    ..remindMinute = e.remindTime.minute
    ..isEnabled = e.isEnabled
    ..createdAt = e.createdAt;
}
