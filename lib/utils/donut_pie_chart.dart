import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../models/i_transaction.dart';

class DonutPieChart extends StatelessWidget {
  final List<ITransaction> transactionList;
  final bool animate;
  final bool isIncome;

  DonutPieChart(this.transactionList, this.isIncome, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.PieChart(_getSeries(),
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 60));
  }


 List<charts.Series<ITransaction, double>> _getSeries() {
    return [
      new charts.Series<ITransaction, double>(
        id: 'Sales',
        domainFn: (ITransaction transaction, _) => transaction.categoryID.toDouble(),
        measureFn: (ITransaction transaction, _) => transaction.amount.toDouble(),
        data: transactionList,
      )
    ];
  }
}
}
