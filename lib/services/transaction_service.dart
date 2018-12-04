import '../models/income.dart';
import '../models/expense.dart';
import './local_data_service.dart';
import '../models/category_sumary.dart';
import '../models/category.dart';

class TransactionService {
  Future<List<CategorySummary>> getIncomeCategorySummaries() async {
    List<CategorySummary> result = List();

    var categories = await LocalDataService().getCategories();

    // for (var category in categories) {
    //   var incomeListForCategory = await LocalDataService()
    //       .getIncomeListByCategoryFromLocalStorage(category.id);
    //   CategorySummary categorySummary =
    //       CategorySummary(category, incomeListForCategory);
    //   result.add(categorySummary);
    // }

    // for mocking purposes
    result.add(CategorySummary(Category.withID(0,"Salary"), [
      Income("Salary", 20000, 0, DateTime.now(), ),
      Income("Allowance", 5000, 0, DateTime.now())
    ]));
    result.add(CategorySummary(Category.withID(1,"Investments"),
        [Income("Savings Rent", 2000, 1, DateTime.now())]));
    result.add(CategorySummary(Category.withID(2,"Additional Income"), [
      Income("Appartment Rent", 5000, 2, DateTime.now()),
      Income("Appartment Rent", 4000, 2, DateTime.now())
    ]));

    return result;
  }
}
