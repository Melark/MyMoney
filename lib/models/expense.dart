import 'package:mymoney/models/category.dart';

import './i_transaction.dart';

class Expense implements ITransaction {
  @override
  int id;

  @override
  double amount;

  @override
  String description;

  @override
  String title;

  @override
  int categoryID;

  @override
  DateTime date;

  Expense(this.title, this.amount, this.categoryID, this.date,
      {this.description, this.category});
  Expense.withID(this.id, this.title, this.amount, this.categoryID, this.date,
      {this.description, this.category});

  Expense.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    title = map['title'];
    description = map['description'];
    amount = map['amount'];
    categoryID = map['categoryID'];
    date = map['date'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['title'] = title;
    map['description'] = description ?? "";
    map['amount'] = amount;
    map['categoryID'] = categoryID;
    map['date'] = date;

    return map;
  }

  @override
  Category category;
}
