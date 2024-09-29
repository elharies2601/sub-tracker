// lib/services/database/category_table.dart
import 'package:sqflite/sqflite.dart';
import '../../models/category.dart';

class CategoryTable {
  static const String table = 'categories';

  static final List<Category> defaultCategories = [
    Category(name: 'Streaming Video', color: '#FF0000'),
    Category(name: 'Streaming Musik', color: '#00FF00'),
    Category(name: 'Produktivitas', color: '#0000FF'),
    Category(name: 'Penyimpanan Cloud', color: '#FFFF00'),
    Category(name: 'Keamanan Online', color: '#FF00FF'),
    Category(name: 'Berita dan Media', color: '#00FFFF'),
    Category(name: 'Olahraga dan Kebugaran', color: '#800080'),
    Category(name: 'Pendidikan', color: '#008000'),
    Category(name: 'Perbankan dan Keuangan', color: '#000080'),
    Category(name: 'Permainan', color: '#000080'),
    Category(name: 'Aplikasi Mobile', color: '#000080'),
    Category(name: 'Software Desain dan Kreatif', color: '#000080'),
    Category(name: 'Hosting Website', color: '#000080'),
    Category(name: 'E-commerce n pengiriman premium', color: '#000080'),
    Category(name: 'Makanan dan Minuman', color: '#000080'),
    Category(name: 'Kesehatan dan Wellness', color: '#000080'),
    Category(name: 'Transportasi', color: '#000080'),
    Category(name: 'Lainnya', color: '#808080'),
  ];

  static Future<void> createTable(Database db) async {
    await db.execute('''
    CREATE TABLE $table(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      color TEXT
    )
    ''');
  }

  static Future<int> insert(Database db, Category category) async {
    return await db.insert(table, category.toMap());
  }

  static Future<void> insertDefaultCategories(Database db) async {
    Batch batch = db.batch();
    for (var category in defaultCategories) {
      batch.insert(table, category.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  static Future<bool> isTableEmpty(Database db) async {
    final result = await db.rawQuery('SELECT COUNT(*) FROM $table');
    int? count = Sqflite.firstIntValue(result);
    return count == 0;
  }

  static Future<List<Category>> getAll(Database db) async {
    final List<Map<String, dynamic>> maps = await db.query(table);
    return List.generate(maps.length, (i) => Category.fromMap(maps[i]));
  }

  static Future<String> getCategoryName(Database db, int id) async {
    final List<Map<String, dynamic>> maps = await db.query(table, where: 'id = ?', whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Category.fromMap(maps.first).name;
    }
    return "";
  }
}