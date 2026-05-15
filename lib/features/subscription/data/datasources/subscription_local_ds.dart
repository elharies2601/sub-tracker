import 'package:isar/isar.dart';

import '../models/subscription_model.dart';

/// Responsible ONLY for raw Isar CRUD.
/// No business logic here — that lives in use cases.
abstract interface class SubscriptionLocalDataSource {
  Stream<List<SubscriptionModel>> watchAll();
  Future<List<SubscriptionModel>> getAll();
  Future<SubscriptionModel?> getById(int id);
  Future<SubscriptionModel> save(SubscriptionModel model); // insert or update
  Future<void> delete(int id);
  Future<List<SubscriptionModel>> getUpcoming(DateTime before);
}

class SubscriptionLocalDataSourceImpl implements SubscriptionLocalDataSource {
  final Isar _isar;
  const SubscriptionLocalDataSourceImpl(this._isar);

  @override
  Stream<List<SubscriptionModel>> watchAll() {
    return _isar.subscriptionModels.where().sortByNextBillingDate().watch(
      fireImmediately: true,
    );
  }

  @override
  Future<List<SubscriptionModel>> getAll() {
    return _isar.subscriptionModels.where().sortByNextBillingDate().findAll();
  }

  @override
  Future<SubscriptionModel?> getById(int id) {
    return _isar.subscriptionModels.get(id);
  }

  @override
  Future<SubscriptionModel> save(SubscriptionModel model) async {
    await _isar.writeTxn(() async {
      await _isar.subscriptionModels.put(model);
    });
    // Return with auto-generated id if new
    return (await _isar.subscriptionModels.get(model.id))!;
  }

  @override
  Future<void> delete(int id) {
    return _isar.writeTxn(() async {
      await _isar.subscriptionModels.delete(id);
    });
  }

  @override
  Future<List<SubscriptionModel>> getUpcoming(DateTime before) {
    return _isar.subscriptionModels
        .where()
        .nextBillingDateLessThan(before)
        .filter()
        .statusEqualTo(StatusDb.active)
        .sortByNextBillingDate()
        .findAll();
  }
}
