import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription.freezed.dart';

enum BillingCycle { weekly, monthly, yearly }

enum SubscriptionStatus { active, paused, cancelled }

@freezed
abstract class Subscription with _$Subscription {
  const Subscription._(); // enables custom methods

  const factory Subscription({
    required int id,
    required String name,
    required String category,
    required double amount,
    required String currency,
    required BillingCycle billingCycle,
    required int billingDay, // day of month/week billing occurs
    required DateTime startDate,
    required DateTime nextBillingDate,
    @Default(SubscriptionStatus.active) SubscriptionStatus status,
    String? notes,
    String? iconUrl,
    String? colorHex,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Subscription;

  // ── Derived getters ──────────────────────────────────────────────

  bool get isActive => status == SubscriptionStatus.active;

  /// Monthly equivalent cost for dashboard summary
  double get monthlyCost {
    return switch (billingCycle) {
      BillingCycle.weekly => amount * 4.33,
      BillingCycle.monthly => amount,
      BillingCycle.yearly => amount / 12,
    };
  }

  /// Days until next billing from today
  int get daysUntilBilling {
    final today = DateTime.now();
    return nextBillingDate
        .difference(DateTime(today.year, today.month, today.day))
        .inDays;
  }

  bool get isDueThisWeek => daysUntilBilling >= 0 && daysUntilBilling <= 7;
  bool get isDueToday => daysUntilBilling == 0;
  bool get isOverdue => daysUntilBilling < 0;

  /// Compute the NEXT billing date after [from]
  DateTime computeNextBillingDate({DateTime? from}) {
    final base = from ?? DateTime.now();
    return switch (billingCycle) {
      BillingCycle.weekly => base.add(const Duration(days: 7)),
      BillingCycle.monthly => DateTime(base.year, base.month + 1, billingDay),
      BillingCycle.yearly => DateTime(base.year + 1, base.month, billingDay),
    };
  }
}
