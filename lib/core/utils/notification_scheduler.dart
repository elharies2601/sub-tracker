import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../../features/subscription/domain/entities/subscription.dart';

/// Single entry point for ALL notification operations.
///
/// Responsibilities:
///  1. Initialize the plugin once at app startup
///  2. Schedule reminders for a single subscription
///  3. Cancel reminders for a deleted subscription
///  4. Reschedule ALL subscriptions on app restart (critical for Android)
///
/// Notification ID strategy:
///   Each reminder gets a deterministic int ID:
///   subscriptionId * 100 + daysBefore
///   e.g. sub #3, 7 days before → ID 307
///   This lets us cancel/reschedule precisely without a lookup table.
class NotificationScheduler {
  NotificationScheduler._();
  static final NotificationScheduler instance = NotificationScheduler._();

  final _plugin = FlutterLocalNotificationsPlugin();
  bool _initialized = false;

  // ── Init ─────────────────────────────────────────────────────────

  Future<void> init() async {
    if (_initialized) return;

    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings(
      requestAlertPermission: false, // ask explicitly via requestPermissions()
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: iOS),
      onDidReceiveNotificationResponse: _onNotificationTap,
      onDidReceiveBackgroundNotificationResponse: _onBackgroundNotificationTap,
    );

    _initialized = true;
  }

  // ── Permission ───────────────────────────────────────────────────

  Future<bool> requestPermissions() async {
    // iOS
    final ios = await _plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);

    // Android 13+
    final android = await _plugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();

    return (ios ?? false) || (android ?? false);
  }

  // ── Schedule for ONE subscription ────────────────────────────────

  /// Schedules reminders at [daysBefore] days before [nextBillingDate].
  /// Default reminder offsets: 7 days, 3 days, 1 day, and day-of.
  Future<void> scheduleForSubscription(
    Subscription sub, {
    List<int> daysBefore = const [7, 3, 1, 0],
    TimeOfDay reminderTime = const TimeOfDay(hour: 9, minute: 0),
  }) async {
    // Cancel existing reminders first to avoid duplicates
    await cancelForSubscription(sub.id);

    if (!sub.isActive) return; // don't schedule for paused/cancelled

    for (final days in daysBefore) {
      final triggerDate = _triggerDateTime(
        sub.nextBillingDate,
        days,
        reminderTime,
      );

      // Skip if trigger is in the past
      if (triggerDate.isBefore(tz.TZDateTime.now(tz.local))) continue;

      final notifId = _notifId(sub.id, days);
      final (title, body) = _notifContent(sub, days);

      await _plugin.zonedSchedule(
        notifId,
        title,
        body,
        triggerDate,
        _notifDetails(sub),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: 'subscription:${sub.id}',
      );
    }
  }

  // ── Cancel for ONE subscription ───────────────────────────────────

  Future<void> cancelForSubscription(
    int subscriptionId, {
    List<int> daysBefore = const [7, 3, 1, 0],
  }) async {
    for (final days in daysBefore) {
      await _plugin.cancel(_notifId(subscriptionId, days));
    }
  }

  // ── Reschedule ALL (call on app startup) ──────────────────────────

  /// Android kills scheduled notifications on device restart.
  /// Call this in main() after Isar is open, passing all active subscriptions.
  Future<void> rescheduleAll(
    List<Subscription> subscriptions, {
    TimeOfDay reminderTime = const TimeOfDay(hour: 9, minute: 0),
  }) async {
    // Cancel everything first for a clean slate
    await _plugin.cancelAll();

    for (final sub in subscriptions) {
      if (sub.isActive) {
        await scheduleForSubscription(sub, reminderTime: reminderTime);
      }
    }
  }

  // ── Cancel all ────────────────────────────────────────────────────

  Future<void> cancelAll() => _plugin.cancelAll();

  // ── Helpers ───────────────────────────────────────────────────────

  /// Deterministic notification ID from subscriptionId + daysBefore offset.
  int _notifId(int subscriptionId, int daysBefore) =>
      subscriptionId * 100 + daysBefore;

  tz.TZDateTime _triggerDateTime(
    DateTime billingDate,
    int daysBefore,
    TimeOfDay time,
  ) {
    final date = billingDate.subtract(Duration(days: daysBefore));
    return tz.TZDateTime(
      tz.local,
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );
  }

  (String title, String body) _notifContent(Subscription sub, int daysBefore) {
    final amount = '${sub.currency} ${sub.amount.toStringAsFixed(0)}';
    return switch (daysBefore) {
      0 => (
        '${sub.name} is due today',
        'Payment of $amount is due today. Tap to confirm.',
      ),
      1 => ('${sub.name} due tomorrow', '$amount will be charged tomorrow.'),
      _ => (
        '${sub.name} in $daysBefore days',
        '$amount scheduled in $daysBefore days.',
      ),
    };
  }

  NotificationDetails _notifDetails(Subscription sub) {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'subscription_reminders', // channel id
        'Subscription reminders', // channel name
        channelDescription: 'Reminders for upcoming subscription payments',
        importance: Importance.high,
        priority: Priority.high,
        color: _hexToColor(sub.colorHex),
        styleInformation: const BigTextStyleInformation(''),
        groupKey: 'subscription_reminders',
      ),
      iOS: const DarwinNotificationDetails(
        categoryIdentifier: 'subscription_reminder',
        threadIdentifier: 'subscription_reminders',
      ),
    );
  }

  // parse #RRGGBB → Color (returns null if invalid, plugin ignores null)
  dynamic _hexToColor(String? hex) {
    if (hex == null) return null;
    try {
      return int.parse('FF${hex.replaceAll('#', '')}', radix: 16);
    } catch (_) {
      return null;
    }
  }
}

// ── Notification tap handlers (must be top-level for background) ──

void _onNotificationTap(NotificationResponse response) {
  // Navigate to subscription detail
  // Use a global navigator key or Riverpod to handle navigation
  final payload = response.payload; // e.g. "subscription:3"
  if (payload != null && payload.startsWith('subscription:')) {
    final id = int.tryParse(payload.split(':').last);
    if (id != null) {
      NotificationNavigationEvent.instance.onTap?.call(id);
    }
  }
}

@pragma('vm:entry-point')
void _onBackgroundNotificationTap(NotificationResponse response) {
  _onNotificationTap(response);
}

/// Simple event bus for notification taps → navigation.
/// Register a handler in your router or shell widget.
class NotificationNavigationEvent {
  NotificationNavigationEvent._();
  static final instance = NotificationNavigationEvent._();
  void Function(int subscriptionId)? onTap;
}
