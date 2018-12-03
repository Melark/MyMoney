import './category.dart';
import './i_transaction.dart';

class CategorySummary {
  List<ITransaction> _transactionList;
  Category _category;

  CategorySummary(this._category, this._transactionList);

  double _calculateCategoryTotal() {
    double total = 0;
    for (var transaction in _transactionList) {
      total += transaction.amount;
    }

    return total;
  }

  double get categoryTransactionTotal => _calculateCategoryTotal();
  
  int get categoryTransactionCount => _transactionList.length;
  int get categoryID => _category.id;
}
