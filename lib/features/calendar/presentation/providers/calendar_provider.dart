import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sub_tracker_v2/features/subscription/domain/entities/subscription.dart';
import '../../../subscription/presentation/providers/payment_history_provider.dart';
import '../../domain/entities/calendar_event.dart';
import '../../domain/usecases/get_calendar_events.dart';
import '../../../subscription/presentation/providers/subscription_provider.dart';

part 'calendar_provider.g.dart';

// ── Use case provider ─────────────────────────────────────────────

@riverpod
GetCalendarEvents getCalendarEvents(Ref ref) => const GetCalendarEvents();

// ── Focused month state ───────────────────────────────────────────

@riverpod
class CalendarFocusedMonth extends _$CalendarFocusedMonth {
  @override
  DateTime build() {
    final now = DateTime.now();
    return DateTime(now.year, now.month);
  }

  void setMonth(DateTime month) => state = DateTime(month.year, month.month);
}

// ── Paid dates set — built from payment history ───────────────────
//
// Key format: "subscriptionId_yyyy-MM-dd"
// e.g. "3_2026-05-14" means sub #3 was paid on 14 May 2026.
// Built once per focused-month change and cached by Riverpod.

@riverpod
Future<Set<String>> calendarPaidDates(Ref ref) async {
  final subsAsync = ref.watch(subscriptionsStreamProvider);

  final subs = subsAsync.maybeWhen(
    data: (s) => s,
    orElse: () => <Subscription>[],
  );
  if (subs.isEmpty) return {};

  final paidKeys = <String>{};

  for (final sub in subs) {
    final history = await ref.watch(
      paymentHistoryForSubscriptionProvider(sub.id).future,
    );

    for (final payment in history) {
      final d = payment.paidAt;
      final key =
          '${sub.id}_${d.year}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';
      paidKeys.add(key);
    }
  }

  return paidKeys;
}

// ── Calendar events map ───────────────────────────────────────────

@riverpod
Map<DateTime, List<CalendarEvent>> calendarEvents(Ref ref) {
  final subsAsync = ref.watch(subscriptionsStreamProvider);
  final focusedMonth = ref.watch(calendarFocusedMonthProvider);
  final usecase = ref.watch(getCalendarEventsProvider);
  final paidAsync = ref.watch(calendarPaidDatesProvider);

  final subs = subsAsync.maybeWhen(
    data: (s) => s,
    orElse: () => <Subscription>[],
  );
  final paidDates = paidAsync.maybeWhen(
    data: (s) => s,
    orElse: () => <String>{},
  );

  return usecase(
    subscriptions: subs,
    focusedMonth: focusedMonth,
    paidDates: paidDates,
  );
}

/// Events for a specific selected day (used by day detail panel).
@riverpod
List<CalendarEvent> eventsForDay(Ref ref, DateTime day) {
  final normalized = DateTime(day.year, day.month, day.day);
  return ref.watch(calendarEventsProvider)[normalized] ?? [];
}

/// Monthly total for the currently focused month (shown in header).
@riverpod
(double, String) calendarMonthlyTotal(Ref ref) {
  final focusedMonth = ref.watch(calendarFocusedMonthProvider);
  final events = ref.watch(calendarEventsProvider);

  double total = 0;
  String currency = 'IDR';

  for (final entry in events.entries) {
    final date = entry.key;
    if (date.year == focusedMonth.year && date.month == focusedMonth.month) {
      for (final e in entry.value) {
        total += e.subscription.amount;
        currency = e.subscription.currency;
      }
    }
  }

  return (total, currency);
}
