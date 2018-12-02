import 'package:flutter/material.dart';
import '../models/income.dart';
import '../utils/donut_pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/local_data_service.dart';
import '../models/category.dart';
import '../utils/transaction_list_view.dart';

class IncomePage extends StatefulWidget {
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  List<Income> incomeList = List<Income>();
  List<Category> categoryList = List();
  List<String> someList = ["", "", "", "", ""];

  @override
  void initState() {
    LocalDataService().getIncomeListFromLocalStorage().then((incomes) {
      this.setState(() {
        incomeList = incomes;
        for (var i = 0; i < 10; i++) {
          incomeList.add(Income("Income $i", 10,0, DateTime.now()));
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
            Expanded(child: DonutPieChart(incomeList, true),),
            Expanded(child: TransactionListView(incomeList),)
          ],
        )
        
        );
  }
}
