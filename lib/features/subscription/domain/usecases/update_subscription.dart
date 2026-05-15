import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/base/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';

class UpdateSubscription implements UseCase<Subscription, Subscription> {
  final SubscriptionRepository _repo;
  const UpdateSubscription(this._repo);

  @override
  Future<Either<Failure, Subscription>> call(Subscription updated) =>
      _repo.update(updated.copyWith(updatedAt: DateTime.now()));
}
