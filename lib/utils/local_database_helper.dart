import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import '../models/category.dart';
import '../models/income.dart';
import '../models/expense.dart';

class LocalDatabaseHelper {
  static LocalDatabaseHelper _localDatabaseHelper;
  static Database _database;

  static const String DATABASE_NAME = "budget.db";

  static const String CATEGORIES_TABLE_NAME = "categories_table";
  static const String CATEGORIES_ID_COL = "id";
  static const String CATEGORIES_VALUE_COL = "value";

  static const String INCOME_TABLE_NAME = "income_table";
  static const String EXPENSES_TABLE_NAME = "expenses_table";

  static const String INCOME_EXPENSE_ID_COL = "id";
  static const String INCOME_EXPENSE_TITLE_COL = "title";
  static const String INCOME_EXPENSE_DESCRIPTION_COL = "description";
  static const String INCOME_EXPENSE_AMOUNT_COL = "amount";
  static const String INCOME_EXPENSE_DATE_COL = "date";
  static const String INCOME_EXPENSE_CATEGORY_ID_COL = "categoryID";

  LocalDatabaseHelper._createInstance();

  factory LocalDatabaseHelper() {
    // Singleton
    if (_localDatabaseHelper == null) {
      _localDatabaseHelper = LocalDatabaseHelper._createInstance();
    }

    return _localDatabaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }

    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + DATABASE_NAME;

    var budgetDB = openDatabase(path, version: 1, onCreate: _createDb);
    return budgetDB;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $CATEGORIES_TABLE_NAME ($CATEGORIES_ID_COL INTEGER PRIMARY KEY AUTOINCREMENT, $CATEGORIES_VALUE_COL TEXT)');

        await db.execute(
        'CREATE TABLE $INCOME_TABLE_NAME ($INCOME_EXPENSE_ID_COL INTEGER PRIMARY KEY AUTOINCREMENT, $INCOME_EXPENSE_TITLE_COL TEXT, $INCOME_EXPENSE_DESCRIPTION_COL TEXT, $INCOME_EXPENSE_AMOUNT_COL real, $INCOME_EXPENSE_DATE_COL TEXT, $INCOME_EXPENSE_CATEGORY_ID_COL integer)');

        await db.execute(
        'CREATE TABLE $EXPENSES_TABLE_NAME ($INCOME_EXPENSE_ID_COL INTEGER PRIMARY KEY AUTOINCREMENT, $INCOME_EXPENSE_TITLE_COL TEXT, $INCOME_EXPENSE_DESCRIPTION_COL TEXT, $INCOME_EXPENSE_AMOUNT_COL real, $INCOME_EXPENSE_DATE_COL TEXT, $INCOME_EXPENSE_CATEGORY_ID_COL integer)');
        
  }

  // CATEGORIES

  Future<List<Map<String, dynamic>>> getCategoriesMapList() async {
    Database db = await this.database;
    var result = await db.query(CATEGORIES_TABLE_NAME);
    return result;
  }

  Future<Map<String, dynamic>> getSpecificCategoryMap(int id) async {
    Database db = await this.database;
    var result = await db.query(CATEGORIES_TABLE_NAME,
        where: '$CATEGORIES_ID_COL = ?', whereArgs: [id]);
    return result[0];
  }

  Future<int> insertCategory(Category category) async {
    Database db = await this.database;
    var result = await db.rawInsert(
        "INSERT INTO $CATEGORIES_TABLE_NAME ($CATEGORIES_VALUE_COL) VALUES (?)",
        [category.value]);
    return result;
  }

  Future<int> updateCategory(Category category) async {
    Database db = await this.database;
    var result = await db.update(CATEGORIES_TABLE_NAME, category.toMap(),
        where: '$CATEGORIES_ID_COL = ?', whereArgs: [category.id]);
    return result;
  }

  Future<int> deleteCategory(Category category) async {
    Database db = await this.database;
    var result = await db.delete(CATEGORIES_TABLE_NAME,
        where: '$CATEGORIES_ID_COL = ?', whereArgs: [category.id]);
    return result;
  }

  // INCOMES

  Future<List<Map<String, dynamic>>> getIncomeMapList() async {
    Database db = await this.database;
    var result = await db.query(INCOME_TABLE_NAME);
    return result;
  }

  Future<int> insertIncome(Income income) async {
    Database db = await this.database;
    var result = await db.rawInsert(
        "INSERT INTO $INCOME_TABLE_NAME ($INCOME_EXPENSE_TITLE_COL, $INCOME_EXPENSE_DESCRIPTION_COL, $INCOME_EXPENSE_AMOUNT_COL, $INCOME_EXPENSE_DATE_COL, $INCOME_EXPENSE_CATEGORY_ID_COL) VALUES (?,?,?,?,?)",
        [income.title, income.description,income.amount,income.date,income.categoryID]);
    return result;
  }

  // EXPENSES
  Future<List<Map<String, dynamic>>> getExpensesMapList() async {
    Database db = await this.database;
    var result = await db.query(EXPENSES_TABLE_NAME);
    return result;
  }

  Future<int> insertExpense(Expense expense) async {
    Database db = await this.database;
    var result = await db.rawInsert(
        "INSERT INTO $EXPENSES_TABLE_NAME ($INCOME_EXPENSE_TITLE_COL, $INCOME_EXPENSE_DESCRIPTION_COL, $INCOME_EXPENSE_AMOUNT_COL, $INCOME_EXPENSE_DATE_COL, $INCOME_EXPENSE_CATEGORY_ID_COL) VALUES (?,?,?,?,?)",
        [expense.title, expense.description,expense.amount,expense.date,expense.categoryID]);
    return result;
  }
}
