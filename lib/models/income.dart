import 'package:mymoney/models/category.dart';

import './i_transaction.dart';

class Income implements ITransaction{
  @override
  double amount;

  @override
  String description;

  @override
  String title;

@override
  Category category;

  /* {  } around the parameter indicates that it is a named parameter and not a positional parameter. 
    Positional parameters are required to be in the order which they were defined in ex... new Income("this is a title', 100);
    the named parameter indicates that it is optional and you access it by name. ex... new Income("this is a title', 100, description: "This is a description");
  */  
  Income(this.title,this.amount, {this.description, this.category});
}
