import 'package:mymoney/models/category.dart';

import './i_transaction.dart';

class Income implements ITransaction {
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

  /* {  } around the parameter indicates that it is a named parameter and not a positional parameter. 
    Positional parameters are required to be in the order which they were defined in ex... new Income("this is a title', 100);
    the named parameter indicates that it is optional and you access it by name. ex... new Income("this is a title', 100, description: "This is a description");
  */
  Income(this.title, this.amount, this.categoryID, this.date,
      [this.description]);
      
  Income.withID(this.id, this.title, this.amount, this.categoryID, this.date,
      [this.description]);

  Income.fromMapObject(Map<String, dynamic> map) {
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
}
