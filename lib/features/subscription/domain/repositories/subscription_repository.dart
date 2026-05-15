import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failures.dart';
import '../entities/subscription.dart';

/// Pure interface — domain layer does NOT know about Isar or any DB.
/// Returns [Either<Failure, T>] to handle errors without throwing exceptions.
abstract interface class SubscriptionRepository {
  /// Watch all subscriptions as a reactive stream (for Riverpod StreamProvider)
  Stream<List<Subscription>> watchAll();

  /// One-shot read — used by use cases that don't need reactivity
  Future<Either<Failure, List<Subscription>>> getAll();

  Future<Either<Failure, Subscription>> getById(int id);

  Future<Either<Failure, Subscription>> add(Subscription subscription);

  Future<Either<Failure, Subscription>> update(Subscription subscription);

  Future<Either<Failure, Unit>> delete(int id);

  /// Returns active subscriptions with nextBillingDate within [days] days
  Future<Either<Failure, List<Subscription>>> getUpcoming({int days = 7});
}
