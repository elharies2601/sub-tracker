import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/base/usecase.dart';
import '../../../subscription/presentation/providers/payment_history_provider.dart';
import '../../domain/models/spending_summary.dart';
import '../../domain/get_spending_summary.dart';
import '../../../subscription/presentation/providers/subscription_provider.dart';

part 'dashboard_provider.g.dart';

@riverpod
GetSpendingSummary getSpendingSummary(Ref ref) => GetSpendingSummary(
  ref.watch(subscriptionRepositoryProvider),
  ref.watch(paymentHistoryRepositoryProvider),
);

/// Reactive dashboard data — rebuilds whenever subscriptions stream emits.
/// We watch [subscriptionsStreamProvider] to trigger invalidation on DB change,
/// then run the use case for the full aggregation.
@riverpod
Future<SpendingSummary> dashboardSummary(Ref ref) async {
  // Establish reactive dependency on the stream
  ref.watch(subscriptionsStreamProvider);

  final result = await ref
      .read(getSpendingSummaryProvider)
      .call(const NoParams());

  return result.fold(
    (failure) => throw Exception(failure.message),
    (summary) => summary,
  );
}
