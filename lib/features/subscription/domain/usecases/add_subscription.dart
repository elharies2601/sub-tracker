import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/base/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';
import '../models/add_subscription_params.dart';

class AddSubscription implements UseCase<Subscription, AddSubscriptionParams> {
  final SubscriptionRepository _repo;
  const AddSubscription(this._repo);

  @override
  Future<Either<Failure, Subscription>> call(AddSubscriptionParams p) {
    final now = DateTime.now();

    // Build entity — id=0 means auto-assign by DB
    final subscription = Subscription(
      id: 0,
      name: p.name.trim(),
      category: p.category,
      amount: p.amount,
      currency: p.currency,
      billingCycle: p.billingCycle,
      billingDay: p.billingDay,
      startDate: p.startDate,
      nextBillingDate: _computeFirstBillingDate(p),
      notes: p.notes,
      colorHex: p.colorHex,
      createdAt: now,
      updatedAt: now,
    );

    return _repo.add(subscription);
  }

  DateTime _computeFirstBillingDate(AddSubscriptionParams p) {
    // First billing = based on start date + cycle
    return switch (p.billingCycle) {
      BillingCycle.weekly => p.startDate.add(const Duration(days: 7)),
      BillingCycle.monthly => DateTime(
        p.startDate.year,
        p.startDate.month + 1,
        p.billingDay,
      ),
      BillingCycle.yearly => DateTime(
        p.startDate.year + 1,
        p.startDate.month,
        p.billingDay,
      ),
    };
  }
}
