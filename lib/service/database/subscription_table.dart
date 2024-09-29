// lib/services/database/subscription_table.dart
import 'package:sqflite/sqflite.dart';
import 'package:sub_tracker/service/database/category_table.dart';
import '../../models/subscription.dart';

class SubscriptionTable {
  static const String table = 'subscriptions';

  static Future<void> createTable(Database db) async {
    await db.execute('''
    CREATE TABLE $table(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      service_name TEXT NOT NULL,
      cost REAL NOT NULL,
      billing_cycle TEXT NOT NULL,
      start_payment_date TEXT NOT NULL,
      latest_payment_date TEXT,
      next_payment_date TEXT,
      status TEXT NOT NULL,
      created_at TEXT NOT NULL,
      updated_at TEXT,
      category_id INTEGER
    )
    ''');
  }

  static Future<int> insert(Database db, Subscription subscription) async {
    return await db.insert(table, subscription.toMap());
  }

  static Future<List<Subscription>> getAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) => Subscription.fromMap(maps[i]));
  }

  static Future<List<Subscription>> getAllActiveWithCategory(Database db) async {
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT s.*, c.name as categoryName FROM $table s 
      LEFT JOIN ${CategoryTable.table} c ON s.category_id = c.id
      WHERE s.status != 'done'
      ORDER BY s.next_payment_date asc
    ''');
    return List.generate(maps.length, (i) => Subscription.fromMap(maps[i]));
  }

  static Future<double> getSumAllTransactionThisMonth(Database db) async {
    final DateTime now = DateTime.now();
    final String currentMonth = now.month.toString().padLeft(2, '0'); // Format bulan menjadi dua digit
    final String currentYear = now.year.toString();

    var result = await db.rawQuery('''
      SELECT SUM(cost) as total FROM $table
      WHERE strftime('%m', next_payment_date) = ? AND strftime('%Y', next_payment_date) = ? AND status = 'active'
    ''', [currentMonth, currentYear]);

    if (result.isNotEmpty && result.first['total'] != null) {
      return result.first['total'] as double;
    } else {
      return 0.0;
    }
  }

  static Future<Subscription?> getById(Database db, int id) async {
    final List<Map<String, dynamic>> maps = await db.query(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Subscription.fromMap(maps.first);
    }
    return null;
  }

  static Future<int> update(Database db, Subscription subscription) async {
    return await db.update(
      table,
      subscription.toMap(),
      where: 'id = ?',
      whereArgs: [subscription.id],
    );
  }

  static Future<int> delete(Database db, int id) async {
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
