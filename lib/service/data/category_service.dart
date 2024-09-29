import 'package:get/get.dart';
import 'package:sub_tracker/models/category.dart';
import 'package:sub_tracker/service/database/category_table.dart';
import 'package:sub_tracker/service/database_helper.dart';

class CategoryService extends GetxService {
  final DatabaseHelper _databaseHelper = DatabaseHelper.instance;

  Future<CategoryService> init() async {
    await _databaseHelper.database;
    return this;
  }

  Future<List<Category>> getAllCategories() async {
    final db = await _databaseHelper.database;
    return await CategoryTable.getAll(db);
  }

  Future<int> insertCategory(Category category) async {
    final db = await _databaseHelper.database;
    return await CategoryTable.insert(db, category);
  }
}