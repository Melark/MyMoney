import '../utils/local_database_helper.dart';
import '../models/income.dart';
import '../models/category.dart';
import '../models/expense.dart';

class LocalDataService {
  LocalDatabaseHelper _localDatabaseHelper = LocalDatabaseHelper();

  Future<List<Income>> GetIncomeListFromLocalStorage() async {
    var incomeMaps = await _localDatabaseHelper.getIncomeMapList();
    List<Income> incomeList = List<Income>();

    for (var map in incomeMaps) {
      incomeList.add(Income.fromMapObject(map));
    }

    return incomeList;
  }

  Future<int> InsertIncomeIntoLocalStorage(Income income) async {
    return await _localDatabaseHelper.insertIncome(income);
  }
}
