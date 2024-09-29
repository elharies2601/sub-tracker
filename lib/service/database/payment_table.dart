import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sub_tracker/helper/constants/const_billing_cycle.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';
import 'package:sub_tracker/helper/extensions/string_extension.dart';
import 'package:sub_tracker/models/payment.dart';

class PaymentTable {
  static const String table = 'payments';

  static Future<void> createTable(Database db) async {
    await db.execute('''
      CREATE TABLE $table(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        payment_date TEXT NOT NULL,
        note TEXT,
        created_at TEXT NOT NULL,
        id_subscription INTEGER
      )
    ''');
  }

  static Future<int> insert(Database db, Payment payload) async {
    return await db.insert(table, payload.toMap());
  }

  static Future<List<Payment>> getAll(Database db, int subscriptionId) async {
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * FROM $table WHERE id_subscription = $subscriptionId ORDER BY payment_date desc
    ''');
    return List.generate(maps.length, (i) => Payment.fromMap(maps[i]));
  }

  static Future<int> update(Database db, Payment newPayment) async {
    return await db.update(table, newPayment.toMap(),
        where: 'id = ?', whereArgs: [newPayment.id]);
  }

  static Future<bool> checkPaymentExist(
      Database db, int subscriptionId, String date, String billingType) async {
    if (billingType == ConstBillingCycle.bulanan.toLowerCase()) {
      String formattedDate =
          date.toDateTime().toFormatString(format: 'yyyy-MM');
      final result = await db.rawQuery(
          'SELECT * FROM $table WHERE id_subscription = ? AND strftime("%Y-%m", payment_date) = ?',
          [subscriptionId, formattedDate]);
      return result.isNotEmpty;
    } else if (billingType == ConstBillingCycle.mingguan.toLowerCase()) {
      final selectedDate = date.toDateTime();
      // var weekOfYear = int.parse(DateFormat('W').format(selectedDate));
      var year = selectedDate.year;
      int weekOfYear = ((selectedDate.difference(DateTime(year, 1, 1)).inDays) / 7).ceil();
      final result = await db.rawQuery(
          'SELECT * FROM $table WHERE id_subscription = ? AND strftime("%Y", payment_date) = ? AND strftime("%W", payment_date) = ? ',
          [subscriptionId, year.toString(), weekOfYear.toString()]);
      return result.isNotEmpty;
    } else  if (billingType == ConstBillingCycle.tahunan.toLowerCase()) {
      final year = date.toDateTime().toFormatString(format: 'yyyy');
      final result = await db.rawQuery(
        'SELECT * FROM $table where id_subscription = ? AND strftime("%Y", payment_date) = ?',
        [subscriptionId, year]
      );
      return result.isNotEmpty;
    }
    return false;
  }
}
