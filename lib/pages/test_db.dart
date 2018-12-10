import 'package:flutter/material.dart';
import '../utils/local_database_helper.dart';
import 'dart:async';

import '../models/category.dart';


class TestDB extends StatefulWidget {
  _TestDBState createState() => _TestDBState();
}

class _TestDBState extends State<TestDB> {
  LocalDatabaseHelper localDatabaseHelper = LocalDatabaseHelper();
  List<Category> categories= List<Category>();

  @override
    void initState() {
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Material(
         child: Column(
           children: <Widget>[
             Padding(padding: EdgeInsets.only(top: 40.0),),
             RaisedButton(child: Text("Add Category"), onPressed: () async{ 
               int i = categories.length + 1;
               Category category = Category("category $i");
               await localDatabaseHelper.insertCategory(category);
               var mapList = await localDatabaseHelper.getCategoriesMapList();
               var a = mapList.length;
             },),
           ],
         ),
       ),
    );
  }
}