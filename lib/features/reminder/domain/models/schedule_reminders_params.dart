import 'package:flutter/material.dart';

import '../../../subscription/domain/entities/subscription.dart';

class ScheduleRemindersParams {
  final Subscription subscription;
  final List<int> daysBefore; // e.g. [7, 3, 1, 0]
  final TimeOfDay remindTime;

  const ScheduleRemindersParams({
    required this.subscription,
    this.daysBefore = const [7, 3, 1, 0],
    this.remindTime = const TimeOfDay(hour: 9, minute: 0),
  });
}
