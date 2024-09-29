import 'package:get/get.dart';
import 'package:sub_tracker/models/subscription.dart';
import 'package:sub_tracker/service/database/subscription_table.dart';
import 'package:sub_tracker/service/database_helper.dart';

class SubscriptionService extends GetxService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<SubscriptionService> init() async {
    await _databaseHelper.database;
    return this;
  }

  Future<List<Subscription>> getAllSubscriptions() async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.getAll(db);
  }

  Future<List<Subscription>> getAllSubscriptionsWithCategoryName() async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.getAllActiveWithCategory(db);
  }

  Future<int> insertSubscription(Subscription subscription) async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.insert(db, subscription);
  }

  Future<int> updateSubscription(Subscription subscription) async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.update(db, subscription);
  }

  Future<int> deleteSubscription(int id) async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.delete(db, id);
  }

  Future<Subscription?> getSubscription(int id) async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.getById(db, id);
  }

  Future<double> getSumAllTransactionThisMonth() async {
    final db = await _databaseHelper.database;
    return await SubscriptionTable.getSumAllTransactionThisMonth(db);
  }
}
