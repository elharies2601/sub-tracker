import 'package:fpdart/fpdart.dart';

import '../../../core/error/failures.dart';
import '../domain/entities/subscription.dart';
import '../domain/repositories/subscription_repository.dart';
import 'datasources/subscription_local_ds.dart';
import 'models/subscription_model.dart';

class SubscriptionRepositoryImpl implements SubscriptionRepository {
  final SubscriptionLocalDataSource _localDs;
  const SubscriptionRepositoryImpl(this._localDs);

  // ── Reactive stream (no Either — stream handles its own errors) ──

  @override
  Stream<List<Subscription>> watchAll() {
    return _localDs.watchAll().map(
      (models) => models.map((m) => m.toEntity()).toList(),
    );
  }

  // ── One-shot reads ───────────────────────────────────────────────

  @override
  Future<Either<Failure, List<Subscription>>> getAll() => _guard(() async {
    final models = await _localDs.getAll();
    return models.map((m) => m.toEntity()).toList();
  });

  @override
  Future<Either<Failure, Subscription>> getById(int id) => _guard(() async {
    final model = await _localDs.getById(id);
    if (model == null) throw const NotFoundFailure('Subscription not found');
    return model.toEntity();
  });

  // ── Writes ───────────────────────────────────────────────────────

  @override
  Future<Either<Failure, Subscription>> add(Subscription subscription) =>
      _guard(() async {
        final model = SubscriptionModel.fromEntity(subscription);
        final saved = await _localDs.save(model);
        return saved.toEntity();
      });

  @override
  Future<Either<Failure, Subscription>> update(Subscription subscription) =>
      _guard(() async {
        final model = SubscriptionModel.fromEntity(subscription);
        final saved = await _localDs.save(model);
        return saved.toEntity();
      });

  @override
  Future<Either<Failure, Unit>> delete(int id) => _guard(() async {
    await _localDs.delete(id);
    return unit;
  });

  // ── Upcoming ─────────────────────────────────────────────────────

  @override
  Future<Either<Failure, List<Subscription>>> getUpcoming({int days = 7}) =>
      _guard(() async {
        final before = DateTime.now().add(Duration(days: days));
        final models = await _localDs.getUpcoming(before);
        return models.map((m) => m.toEntity()).toList();
      });

  // ── Error handling helper ────────────────────────────────────────

  Future<Either<Failure, T>> _guard<T>(Future<T> Function() fn) async {
    try {
      return Right(await fn());
    } on Failure catch (f) {
      return Left(f);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}
