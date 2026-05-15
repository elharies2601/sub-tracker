/// Spending breakdown per category
class CategorySpending {
  final String category;
  final double monthlyAmount;
  final double percentage; // 0.0 – 100.0
  final int count; // number of subscriptions

  const CategorySpending({
    required this.category,
    required this.monthlyAmount,
    required this.percentage,
    required this.count,
  });
}
