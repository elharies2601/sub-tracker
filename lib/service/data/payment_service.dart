import 'package:get/get.dart';
import 'package:sub_tracker/models/payment.dart';
import 'package:sub_tracker/service/database/payment_table.dart';
import 'package:sub_tracker/service/database_helper.dart';

class PaymentService extends GetxService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<PaymentService> init() async {
    await _databaseHelper.database;
    return this;
  }

  Future<List<Payment>> getAllPaymentById(int subscriptionId) async {
    final db = await _databaseHelper.database;
    return await PaymentTable.getAll(db, subscriptionId);
  }

  Future<int> insertPayment(Payment payment) async {
    final db = await _databaseHelper.database;
    return await PaymentTable.insert(db, payment);
  }

  Future<bool> checkPaymentExist(int subscriptionId, String date, String billingType) async {
    final db = await _databaseHelper.database;
    return await PaymentTable.checkPaymentExist(db, subscriptionId, date, billingType);
  }
}