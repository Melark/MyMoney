import 'package:flutter/material.dart';
import '../models/income.dart';
import '../utils/donut_pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/local_data_service.dart';
import '../models/category.dart';

class IncomePage extends StatefulWidget {
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  List<Income> incomeList = List<Income>();
  List<Category> categoryList = List();

  charts.Series<CategorySeriesObject, int> pieChartSeries =
      charts.Series<CategorySeriesObject, int>(
    id: 'Sales',
    domainFn: (CategorySeriesObject obj, _) => obj.count,
    measureFn: (CategorySeriesObject obj, _) => 1,
    data: [
      new CategorySeriesObject("Movies", 100),
      new CategorySeriesObject("Necessities", 10),
      new CategorySeriesObject("TakeAways", 50),
      new CategorySeriesObject("Something Else", 10),
    ],
  );

  @override
  void initState() {
    LocalDataService().getIncomeListFromLocalStorage().then((incomes) {
      this.setState(() {
        incomeList = incomes;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Material(
        color: Colors.amber,
        child: DonutPieChart([pieChartSeries], animate: true,)
      ),
    );
  }
}
