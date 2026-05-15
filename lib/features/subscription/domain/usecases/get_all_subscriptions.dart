import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/base/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';

class GetAllSubscriptions implements UseCase<List<Subscription>, NoParams> {
  final SubscriptionRepository _repo;
  const GetAllSubscriptions(this._repo);

  @override
  Future<Either<Failure, List<Subscription>>> call(NoParams _) =>
      _repo.getAll();
}
