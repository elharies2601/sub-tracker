import 'package:isar/isar.dart';

import 'reminder_model.dart';

// ── Data Source ────────────────────────────────────────────────────

abstract interface class ReminderLocalDataSource {
  Future<List<ReminderModel>> getForSubscription(int subscriptionId);
  Future<ReminderModel> save(ReminderModel model);
  Future<void> delete(int id);
  Future<void> deleteAllForSubscription(int subscriptionId);
}

class ReminderLocalDataSourceImpl implements ReminderLocalDataSource {
  final Isar _isar;
  const ReminderLocalDataSourceImpl(this._isar);

  @override
  Future<List<ReminderModel>> getForSubscription(int subscriptionId) => _isar
      .reminderModels
      .filter()
      .subscriptionIdEqualTo(subscriptionId)
      .findAll();

  @override
  Future<ReminderModel> save(ReminderModel model) async {
    await _isar.writeTxn(() => _isar.reminderModels.put(model));
    return (await _isar.reminderModels.get(model.id))!;
  }

  @override
  Future<void> delete(int id) =>
      _isar.writeTxn(() => _isar.reminderModels.delete(id));

  @override
  Future<void> deleteAllForSubscription(int subscriptionId) async {
    final ids = await _isar.reminderModels
        .filter()
        .subscriptionIdEqualTo(subscriptionId)
        .idProperty()
        .findAll();
    await _isar.writeTxn(() => _isar.reminderModels.deleteAll(ids));
  }
}

// ── Repository Implementation ──────────────────────────────────────
