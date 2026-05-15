/// Monthly spending data point — for the bar/line chart
class MonthlySpending {
  final int year;
  final int month;
  final double amount;

  const MonthlySpending({
    required this.year,
    required this.month,
    required this.amount,
  });

  /// Short label: "Jan", "Feb", etc.
  String get label {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return months[month - 1];
  }
}
