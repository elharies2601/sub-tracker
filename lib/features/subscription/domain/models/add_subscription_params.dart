import '../entities/subscription.dart';

class AddSubscriptionParams {
  final String name;
  final String category;
  final double amount;
  final String currency;
  final BillingCycle billingCycle;
  final int billingDay;
  final DateTime startDate;
  final String? notes;
  final String? colorHex;

  const AddSubscriptionParams({
    required this.name,
    required this.category,
    required this.amount,
    required this.currency,
    required this.billingCycle,
    required this.billingDay,
    required this.startDate,
    this.notes,
    this.colorHex,
  });
}
