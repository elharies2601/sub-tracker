import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/base/usecase.dart';
import '../entities/subscription.dart';
import '../repositories/subscription_repository.dart';
import '../models/get_upcoming_params.dart';

class GetUpcomingSubscriptions
    implements UseCase<List<Subscription>, GetUpcomingParams> {
  final SubscriptionRepository _repo;
  const GetUpcomingSubscriptions(this._repo);

  @override
  Future<Either<Failure, List<Subscription>>> call(GetUpcomingParams params) =>
      _repo.getUpcoming(days: params.days);
}
