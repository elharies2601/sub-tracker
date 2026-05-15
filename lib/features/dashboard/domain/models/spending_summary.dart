import 'category_spending.dart';
import 'monthly_spending.dart';

/// Aggregated spending data — computed by GetSpendingSummary use case.
/// Pure value object, no framework dependency.
class SpendingSummary {
  final double monthlyTotal;
  final double yearlyTotal;
  final String currency;
  final int activeCount;
  final int pausedCount;
  final List<CategorySpending> byCategory;
  final List<MonthlySpending> last6Months;

  const SpendingSummary({
    required this.monthlyTotal,
    required this.yearlyTotal,
    required this.currency,
    required this.activeCount,
    required this.pausedCount,
    required this.byCategory,
    required this.last6Months,
  });

  bool get isEmpty => activeCount == 0;

  /// Most expensive category
  CategorySpending? get topCategory =>
      byCategory.isEmpty ? null : byCategory.first;
}
