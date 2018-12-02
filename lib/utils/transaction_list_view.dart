import 'package:flutter/material.dart';
import '../models/i_transaction.dart';

class TransactionListView extends StatelessWidget {

  List<ITransaction> _transactionList;

  TransactionListView(this._transactionList);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: _transactionList.length,
        itemBuilder: (BuildContext context, int index){
          return Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Text(_transactionList[index].title)
              ],
            ),
          );
        },
      ),
    );
  }
}