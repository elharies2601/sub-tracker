import 'package:fpdart/fpdart.dart';

import '../../../core/error/failures.dart';
import '../../../core/base/usecase.dart';
import '../../subscription/domain/repositories/payment_history_repository.dart';
import './models/spending_summary.dart';
import './models/category_spending.dart';
import './models/monthly_spending.dart';
import '../../subscription/domain/entities/subscription.dart';
import '../../subscription/domain/repositories/subscription_repository.dart';

class GetSpendingSummary implements UseCase<SpendingSummary, NoParams> {
  final SubscriptionRepository _subRepo;
  final PaymentHistoryRepository _histRepo;

  const GetSpendingSummary(this._subRepo, this._histRepo);

  @override
  Future<Either<Failure, SpendingSummary>> call(NoParams _) async {
    final subResult = await _subRepo.getAll();
    if (subResult.isLeft()) return Left(subResult.getLeft().toNullable()!);
    final all = subResult.getRight().toNullable()!;

    final currency = _dominantCurrency(all.where((s) => s.isActive).toList());

    // Fetch real monthly data from payment history
    final histResult = await _histRepo.getMonthlySummary(
      months: 6,
      currency: currency,
    );
    final monthlyMap = histResult.getOrElse((_) => {});

    return Right(_compute(all, currency, monthlyMap));
  }

  SpendingSummary _compute(
    List<Subscription> all,
    String currency,
    Map<String, double> monthlyMap,
  ) {
    final active = all.where((s) => s.isActive).toList();
    final paused = all
        .where((s) => s.status == SubscriptionStatus.paused)
        .toList();

    final sameCurrency = active.where((s) => s.currency == currency).toList();
    final monthlyTotal = sameCurrency.fold(
      0.0,
      (sum, s) => sum + s.monthlyCost,
    );
    final yearlyTotal = monthlyTotal * 12;

    final byCategory = _groupByCategory(sameCurrency, monthlyTotal);
    final last6Months = _buildLast6Months(monthlyTotal, monthlyMap);

    return SpendingSummary(
      monthlyTotal: monthlyTotal,
      yearlyTotal: yearlyTotal,
      currency: currency,
      activeCount: active.length,
      pausedCount: paused.length,
      byCategory: byCategory,
      last6Months: last6Months,
    );
  }

  // ── Helpers ────────────────────────────────────────────────────────

  String _dominantCurrency(List<Subscription> active) {
    if (active.isEmpty) return 'IDR';
    final freq = <String, int>{};
    for (final s in active) {
      freq[s.currency] = (freq[s.currency] ?? 0) + 1;
    }
    return freq.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
  }

  List<CategorySpending> _groupByCategory(
    List<Subscription> subs,
    double totalMonthly,
  ) {
    final map = <String, List<Subscription>>{};
    for (final s in subs) {
      (map[s.category] ??= []).add(s);
    }
    final result = map.entries.map((entry) {
      final catTotal = entry.value.fold(0.0, (sum, s) => sum + s.monthlyCost);
      return CategorySpending(
        category: entry.key,
        monthlyAmount: catTotal,
        percentage: totalMonthly > 0 ? (catTotal / totalMonthly) * 100 : 0,
        count: entry.value.length,
      );
    }).toList();
    result.sort((a, b) => b.monthlyAmount.compareTo(a.monthlyAmount));
    return result;
  }

  /// Builds last 6 months from real payment history.
  /// Current month falls back to projected monthlyCost if no payments yet.
  List<MonthlySpending> _buildLast6Months(
    double projectedMonthly,
    Map<String, double> monthlyMap,
  ) {
    final now = DateTime.now();
    return List.generate(6, (i) {
      final date = DateTime(now.year, now.month - (5 - i));
      final key = '${date.year}-${date.month.toString().padLeft(2, '0')}';
      final isCurrentMonth = date.year == now.year && date.month == now.month;

      // Use real payment data if available;
      // for current month with no payments yet, show projected amount.
      final amount = monthlyMap.containsKey(key)
          ? monthlyMap[key]!
          : (isCurrentMonth ? projectedMonthly : 0.0);

      return MonthlySpending(
        year: date.year,
        month: date.month,
        amount: amount,
      );
    });
  }
}
