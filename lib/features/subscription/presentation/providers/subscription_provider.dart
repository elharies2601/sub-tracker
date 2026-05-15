import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/error/failures.dart';
import '../../data/datasources/subscription_local_ds.dart';
import '../../data/subscription_repository_impl.dart';
import '../../domain/entities/subscription.dart';
import '../../domain/models/add_subscription_params.dart';
import '../../domain/models/confirm_payment_params.dart';
import '../../domain/models/delete_subscription_params.dart';
import '../../domain/repositories/subscription_repository.dart';
import '../../domain/usecases/add_subscription.dart';
import '../../domain/usecases/confirm_payment_subscriptions.dart';
import '../../domain/usecases/delete_subscription.dart';
import '../../domain/usecases/get_all_subscriptions.dart';
import '../../domain/usecases/get_upcoming_subscriptions.dart';
import '../../domain/usecases/update_subscription.dart';

part 'subscription_provider.g.dart';

// ══════════════════════════════════════════════════════════════════
//  INFRASTRUCTURE PROVIDERS  (DI layer)
// ══════════════════════════════════════════════════════════════════

/// Isar instance — initialized in main.dart and overridden via ProviderScope
@riverpod
Isar isar(Ref ref) => throw UnimplementedError('Override in ProviderScope');

@riverpod
SubscriptionLocalDataSource subscriptionLocalDs(Ref ref) {
  final isar = ref.watch(isarProvider);
  return SubscriptionLocalDataSourceImpl(isar);
}

@riverpod
SubscriptionRepository subscriptionRepository(Ref ref) {
  final ds = ref.watch(subscriptionLocalDsProvider);
  return SubscriptionRepositoryImpl(ds);
}

// ── Use case providers ─────────────────────────────────────────────

@riverpod
GetAllSubscriptions getAllSubscriptions(Ref ref) =>
    GetAllSubscriptions(ref.watch(subscriptionRepositoryProvider));

@riverpod
AddSubscription addSubscription(Ref ref) =>
    AddSubscription(ref.watch(subscriptionRepositoryProvider));

@riverpod
UpdateSubscription updateSubscription(Ref ref) =>
    UpdateSubscription(ref.watch(subscriptionRepositoryProvider));

@riverpod
DeleteSubscription deleteSubscription(Ref ref) =>
    DeleteSubscription(ref.watch(subscriptionRepositoryProvider));

@riverpod
ConfirmPayment confirmPayment(Ref ref) =>
    ConfirmPayment(ref.watch(subscriptionRepositoryProvider));

@riverpod
GetUpcomingSubscriptions getUpcomingSubscriptions(Ref ref) =>
    GetUpcomingSubscriptions(ref.watch(subscriptionRepositoryProvider));

// ══════════════════════════════════════════════════════════════════
//  STATE PROVIDERS  (UI layer)
// ══════════════════════════════════════════════════════════════════

/// Reactive stream of all subscriptions — auto-updates on DB change
@riverpod
Stream<List<Subscription>> subscriptionsStream(Ref ref) {
  final repo = ref.watch(subscriptionRepositoryProvider);
  return repo.watchAll();
}

/// Breakdown of active subscriptions grouped by billing cycle.
/// Displayed in the list page header — shows each cycle honestly
/// instead of converting everything to a monthly estimate.
class CycleSummary {
  final String cycleLabel; // 'weekly' | 'monthly' | 'yearly'
  final double total;
  final String currency;
  final int count;

  const CycleSummary({
    required this.cycleLabel,
    required this.total,
    required this.currency,
    required this.count,
  });
}

@riverpod
AsyncValue<List<CycleSummary>> billingSummary(Ref ref) {
  return ref.watch(subscriptionsStreamProvider).whenData((list) {
    final active = list.where((s) => s.isActive).toList();
    if (active.isEmpty) return [];

    // Group by (cycle, currency) pair
    final map = <String, _CycleAcc>{};
    for (final s in active) {
      final key = '${s.billingCycle.name}__${s.currency}';
      final acc = map.putIfAbsent(
        key,
        () => _CycleAcc(s.billingCycle.name, s.currency),
      );
      acc.total += s.amount;
      acc.count++;
    }

    // Sort: weekly → monthly → yearly
    const order = ['weekly', 'monthly', 'yearly'];
    return map.values
        .map(
          (a) => CycleSummary(
            cycleLabel: a.cycle,
            total: a.total,
            currency: a.currency,
            count: a.count,
          ),
        )
        .toList()
      ..sort(
        (a, b) =>
            order.indexOf(a.cycleLabel).compareTo(order.indexOf(b.cycleLabel)),
      );
  });
}

class _CycleAcc {
  final String cycle;
  final String currency;
  double total = 0;
  int count = 0;
  _CycleAcc(this.cycle, this.currency);
}

/// Derived: monthly total + dominant currency for display
/// Returns a Record (total, currency) — currency = most-used among active subs.
@riverpod
AsyncValue<(double, String)> monthlyTotal(Ref ref) {
  return ref.watch(subscriptionsStreamProvider).whenData((list) {
    final active = list.where((s) => s.isActive).toList();
    final total = active.fold(0.0, (sum, s) => sum + s.monthlyCost);

    // Pick dominant currency (most frequent among active subs)
    final currency = active.isEmpty
        ? 'IDR'
        : (active..sort(
                (a, b) => active
                    .where((s) => s.currency == b.currency)
                    .length
                    .compareTo(
                      active.where((s) => s.currency == a.currency).length,
                    ),
              ))
              .first
              .currency;

    return (total, currency);
  });
}

/// Derived: upcoming bills in the next 7 days
@riverpod
AsyncValue<List<Subscription>> upcomingBills(Ref ref) {
  return ref
      .watch(subscriptionsStreamProvider)
      .whenData(
        (list) => list.where((s) => s.isActive && s.isDueThisWeek).toList()
          ..sort((a, b) => a.daysUntilBilling.compareTo(b.daysUntilBilling)),
      );
}

// ══════════════════════════════════════════════════════════════════
//  NOTIFIER  (handles user actions)
// ══════════════════════════════════════════════════════════════════

@riverpod
class SubscriptionNotifier extends _$SubscriptionNotifier {
  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> add(AddSubscriptionParams params) async {
    state = const AsyncLoading();
    final result = await ref.read(addSubscriptionProvider).call(params);
    state = result.fold(
      (failure) => AsyncError(_failureMessage(failure), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> update(Subscription subscription) async {
    state = const AsyncLoading();
    final result = await ref
        .read(updateSubscriptionProvider)
        .call(subscription);
    state = result.fold(
      (failure) => AsyncError(_failureMessage(failure), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> delete(int id) async {
    state = const AsyncLoading();
    final result = await ref
        .read(deleteSubscriptionProvider)
        .call(DeleteSubscriptionParams(id));
    state = result.fold(
      (failure) => AsyncError(_failureMessage(failure), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  Future<void> confirmPayment(int subscriptionId) async {
    state = const AsyncLoading();
    final result = await ref
        .read(confirmPaymentProvider)
        .call(ConfirmPaymentParams(subscriptionId));
    state = result.fold(
      (failure) => AsyncError(_failureMessage(failure), StackTrace.current),
      (_) => const AsyncData(null),
    );
  }

  String _failureMessage(Failure f) => switch (f) {
    DatabaseFailure() => 'Database error: ${f.message}',
    NotFoundFailure() => 'Item not found',
    ValidationFailure() => f.message,
    UnknownFailure() => 'Something went wrong',
  };
}
