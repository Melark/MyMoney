import './income.dart';
import './expense.dart';

class Budget {
  int id;
  List<Income> incomes;
  List<Expense> expenses;
  DateTime beginDate;
  DateTime endDate;

  Budget(this.incomes, this.expenses, this.beginDate, this.endDate);
  Budget.withID(
      this.id, this.incomes, this.expenses, this.beginDate, this.endDate);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();

    if (id != null) {
      map['id'] = id;
    }

    map['incomes'] = incomes;
    map['expenses'] = expenses;
    map['beginDate'] = beginDate;
    map['endDate'] = endDate;

    return map;
  }

  Budget.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];

    incomes = map['incomes'];
    expenses = map['expenses'];
    beginDate = map['beginDate'];
    endDate = map['endDate'];
  }
}
