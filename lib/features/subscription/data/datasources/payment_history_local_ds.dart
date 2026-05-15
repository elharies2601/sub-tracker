import 'package:isar/isar.dart';

import '../models/payment_history_model.dart';

abstract interface class PaymentHistoryLocalDataSource {
  Future<PaymentHistoryModel> add(PaymentHistoryModel model);
  Future<List<PaymentHistoryModel>> getForSubscription(int subscriptionId);
  Future<List<PaymentHistoryModel>> getInDateRange(
    DateTime from,
    DateTime to,
    String currency,
  );
  Future<void> deleteForSubscription(int subscriptionId);
}

class PaymentHistoryLocalDataSourceImpl
    implements PaymentHistoryLocalDataSource {
  final Isar _isar;
  const PaymentHistoryLocalDataSourceImpl(this._isar);

  @override
  Future<PaymentHistoryModel> add(PaymentHistoryModel model) async {
    await _isar.writeTxn(() => _isar.paymentHistoryModels.put(model));
    return (await _isar.paymentHistoryModels.get(model.id))!;
  }

  @override
  Future<List<PaymentHistoryModel>> getForSubscription(
    int subscriptionId,
  ) async {
    return _isar.paymentHistoryModels
        .filter()
        .subscriptionIdEqualTo(subscriptionId)
        .sortByPaidAtDesc()
        .findAll();
  }

  @override
  Future<List<PaymentHistoryModel>> getInDateRange(
    DateTime from,
    DateTime to,
    String currency,
  ) async {
    return _isar.paymentHistoryModels
        .filter()
        .paidAtBetween(from, to)
        .and()
        .currencyEqualTo(currency)
        .findAll();
  }

  @override
  Future<void> deleteForSubscription(int subscriptionId) async {
    final ids = await _isar.paymentHistoryModels
        .filter()
        .subscriptionIdEqualTo(subscriptionId)
        .idProperty()
        .findAll();
    await _isar.writeTxn(() => _isar.paymentHistoryModels.deleteAll(ids));
  }
}
