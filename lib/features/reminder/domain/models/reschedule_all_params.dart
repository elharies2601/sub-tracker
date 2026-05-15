import 'package:flutter/material.dart';

import '../../../subscription/domain/entities/subscription.dart';

class RescheduleAllParams {
  final List<Subscription> subscriptions;
  final TimeOfDay remindTime;

  const RescheduleAllParams({
    required this.subscriptions,
    this.remindTime = const TimeOfDay(hour: 9, minute: 0),
  });
}
