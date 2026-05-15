import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/base/usecase.dart';
import '../repositories/subscription_repository.dart';
import '../models/delete_subscription_params.dart';

class DeleteSubscription implements UseCase<Unit, DeleteSubscriptionParams> {
  final SubscriptionRepository _repo;
  const DeleteSubscription(this._repo);

  @override
  Future<Either<Failure, Unit>> call(DeleteSubscriptionParams p) =>
      _repo.delete(p.id);
}
