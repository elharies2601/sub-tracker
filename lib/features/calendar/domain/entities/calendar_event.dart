import '../../../subscription/domain/entities/subscription.dart';

/// A single billing event on the calendar.
class CalendarEvent {
  final Subscription subscription;
  final DateTime date; // normalized to midnight
  final bool isPaid; // true if payment recorded for this date

  const CalendarEvent({
    required this.subscription,
    required this.date,
    this.isPaid = false,
  });

  // isOverdue: only if NOT paid and date has already passed
  bool get isOverdue => !isPaid && date.isBefore(_today()) && !_isToday(date);
  bool get isToday => _isToday(date);

  static DateTime _today() {
    final n = DateTime.now();
    return DateTime(n.year, n.month, n.day);
  }

  static bool _isToday(DateTime d) {
    final n = DateTime.now();
    return d.year == n.year && d.month == n.month && d.day == n.day;
  }
}
