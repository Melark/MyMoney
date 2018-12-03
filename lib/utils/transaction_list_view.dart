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
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_transactionList[index].title, style: TextStyle(fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black45,blurRadius: 10.0 ,offset: Offset(1.0, 1.0))])),
                Text("  R " + _transactionList[index].amount.toString(), style: TextStyle(fontSize: 20.0, color: Colors.white, shadows: [Shadow(color: Colors.black45,blurRadius: 10.0 ,offset: Offset(1.0, 1.0))])),
              ],
            ),
          );
        },
      ),
    );
  }
}