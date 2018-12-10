import '../utils/local_database_helper.dart';
import '../models/income.dart';
import '../models/category.dart';
import '../models/expense.dart';

class LocalDataService {
  LocalDatabaseHelper _localDatabaseHelper = LocalDatabaseHelper();

  Future<List<Income>> getIncomeListFromLocalStorage() async {
    var incomeMaps = await _localDatabaseHelper.getIncomeMapList();
    List<Income> incomeList = List<Income>();

    for (var map in incomeMaps) {
      incomeList.add(Income.fromMapObject(map));
    }

    return incomeList;
  }

  Future<List<Income>> getIncomeListByCategoryFromLocalStorage(int categoryID) async {
    var incomeMaps = await _localDatabaseHelper.getIncomeMapList();
    List<Income> incomeList = List<Income>();

    for (var map in incomeMaps) {
      Income income = Income.fromMapObject(map);
      if (income.categoryID == categoryID)
      {
        incomeList.add(income);
      }
    }
    return incomeList;
  }

  Future<int> insertIncomeIntoLocalStorage(Income income) async {
    return await _localDatabaseHelper.insertIncome(income);
  }

  Future<List<Category>> getCategories() async {
    var categoryMaps = await _localDatabaseHelper.getCategoriesMapList();
    List<Category> categories = List();

    for (var map in categoryMaps) {
      categories.add(Category.fromMapObject(map));
    }

    return categories;
  }

  Future<Category> getSpecificCategory(int id) async{
    var categoryMap = await _localDatabaseHelper.getSpecificCategoryMap(id);
    return Category.fromMapObject(categoryMap);
  }
}
