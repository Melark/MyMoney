import './i_transaction.dart';

class Expense implements ITransaction{
  @override
  double amount;

  @override
  String description;

  @override
  String title;

// Look at income.dart for clarity on this constructor signature
  Expense(this.title,this.amount,{this.description});
}
