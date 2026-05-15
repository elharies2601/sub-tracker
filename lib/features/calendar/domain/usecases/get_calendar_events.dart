import '../../../subscription/domain/entities/subscription.dart';
import '../entities/calendar_event.dart';

class GetCalendarEvents {
  const GetCalendarEvents();

  /// [paidDates]: set of "subscriptionId_yyyy-MM-dd" strings built from
  /// payment history. Passed in from the provider so this class stays
  /// a pure function with no repository dependency.
  Map<DateTime, List<CalendarEvent>> call({
    required List<Subscription> subscriptions,
    required DateTime focusedMonth,
    Set<String> paidDates = const {},
  }) {
    final windowStart = DateTime(focusedMonth.year, focusedMonth.month - 1, 1);
    final windowEnd = DateTime(focusedMonth.year, focusedMonth.month + 2, 0);

    final events = <DateTime, List<CalendarEvent>>{};

    for (final sub in subscriptions) {
      if (!sub.isActive) continue;

      final dates = _billingDatesInWindow(sub, windowStart, windowEnd);
      for (final date in dates) {
        final key = _normalize(date);
        final paidKey =
            '${sub.id}_${key.year}-${key.month.toString().padLeft(2, '0')}-${key.day.toString().padLeft(2, '0')}';
        (events[key] ??= []).add(
          CalendarEvent(
            subscription: sub,
            date: key,
            isPaid: paidDates.contains(paidKey),
          ),
        );
      }
    }

    return events;
  }

  List<DateTime> _billingDatesInWindow(
    Subscription sub,
    DateTime start,
    DateTime end,
  ) {
    final dates = <DateTime>[];
    final subscriptionStart = _normalize(sub.startDate);
    var current = _normalize(sub.nextBillingDate);

    var prev = current;
    while (true) {
      prev = _previousBillingDate(sub, prev);
      if (prev.isBefore(start)) break;
      if (prev.isBefore(subscriptionStart)) break;
      dates.add(prev);
    }

    while (!current.isAfter(end)) {
      if (!current.isBefore(start)) dates.add(current);
      current = _nextBillingDate(sub, current);
    }

    return dates;
  }

  DateTime _nextBillingDate(Subscription sub, DateTime from) {
    return switch (sub.billingCycle) {
      BillingCycle.weekly => from.add(const Duration(days: 7)),
      BillingCycle.monthly => DateTime(
        from.year,
        from.month + 1,
        sub.billingDay,
      ),
      BillingCycle.yearly => DateTime(
        from.year + 1,
        from.month,
        sub.billingDay,
      ),
    };
  }

  DateTime _previousBillingDate(Subscription sub, DateTime from) {
    return switch (sub.billingCycle) {
      BillingCycle.weekly => from.subtract(const Duration(days: 7)),
      BillingCycle.monthly => DateTime(
        from.year,
        from.month - 1,
        sub.billingDay,
      ),
      BillingCycle.yearly => DateTime(
        from.year - 1,
        from.month,
        sub.billingDay,
      ),
    };
  }

  DateTime _normalize(DateTime d) => DateTime(d.year, d.month, d.day);
}
