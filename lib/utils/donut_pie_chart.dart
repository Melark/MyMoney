import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import '../models/category_sumary.dart';
import 'dart:convert';

class DonutPieChart extends StatelessWidget {
  final List<CategorySummary> categories;
  final bool animate;
  final bool isIncome;

  DonutPieChart(this.categories, this.isIncome, {this.animate});

  @override
  Widget build(BuildContext context) {
    var series = [
       charts.Series<CategorySummary,int>(
        id: 'Transactions',
        domainFn: (CategorySummary categorySummary, _) =>
            categorySummary.categoryID,
        measureFn: (CategorySummary categorySummary, _) =>
            categorySummary.categoryTransactionTotal,
        data: categories,
      )
    ];

    return new charts.PieChart(series,
        animate: animate,
        defaultRenderer: new charts.ArcRendererConfig(arcWidth: 50));
  }
}
