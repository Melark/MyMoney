import 'package:flutter/material.dart';
import '../models/income.dart';
import '../utils/donut_pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/local_data_service.dart';
import '../models/category.dart';
import '../utils/transaction_list_view.dart';
import '../services/transaction_service.dart';
import '../models/category_sumary.dart';
import '../pages/add_transaction_page.dart';

class IncomePage extends StatefulWidget {
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  List<Income> incomeList = List<Income>();
  List<Category> categoryList = List();
  List<CategorySummary> categorySummaryList = List();

  @override
  void initState() {
    TransactionService().getIncomeCategorySummaries().then((categorySummaries) {
      LocalDataService().getIncomeListFromLocalStorage().then((incomes) {
        this.setState(() {
          categorySummaryList = categorySummaries;
          incomeList = incomes;
          incomeList.add(Income("Salary", 20000, 1, DateTime.now(), category: Category.withID(0,"Salary")));
          incomeList.add(Income("Allowance", 5000, 1, DateTime.now(), category: Category.withID(0,"Salary")));
          incomeList.add(Income("Savings Rent", 2000, 2, DateTime.now(), category: Category.withID(1,"Investments")));
          incomeList.add(Income("Appartment Rent", 5000, 3, DateTime.now(), category: Category.withID(2,"Additional Income")));
          incomeList.add(Income("Appartment Rent", 4000, 3, DateTime.now(), category: Category.withID(2,"Additional Income")));
        });
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 5.0,),
                Text("My Income",
                style: TextStyle(
                    fontSize: 32.0,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold)),
              ],
            ),
          )
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddTransaction()),
            );
          },
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            
            Padding(
              padding: new EdgeInsets.all(25.0),
              child: new SizedBox(
                height: 250.0,
                child: DonutPieChart(categorySummaryList, true),
              ),
            ),
            Expanded(
              child: TransactionListView(incomeList),
            )
          ],
        ));
  }
}
