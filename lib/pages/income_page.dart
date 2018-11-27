import 'package:flutter/material.dart';
import '../models/income.dart';
import '../utils/donut_pie_chart.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import '../services/local_data_service.dart';

class IncomePage extends StatefulWidget {
  _IncomePageState createState() => _IncomePageState();
}

class _IncomePageState extends State<IncomePage> {
  List<Income> incomeList = List<Income>();


@override
  void initState() {
    LocalDataService().GetIncomeListFromLocalStorage().then((r) =>{
      incomeList = r;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(),
    );
  }
}