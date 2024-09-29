import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sub_tracker/service/database/category_table.dart';
import 'package:sub_tracker/service/database/payment_table.dart';
import 'package:sub_tracker/service/database/subscription_table.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database == null) {
      _database = await _initDB('subscriptions.db');
      return _database!;
    }
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await SubscriptionTable.createTable(db);
    await CategoryTable.createTable(db);
    await PaymentTable.createTable(db);

    if (await CategoryTable.isTableEmpty(db)) {
      await CategoryTable.insertDefaultCategories(db);
    }
  }
}
