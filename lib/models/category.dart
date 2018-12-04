import 'package:flutter/material.dart';

class Category {
  int id;
  String value;

  Category(this.value);
  Category.withID(this.id, this.value);

  Category.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    value = map['value'];
  }

  Color get categoryColor {
    if (id == 0)
    return Colors.blue;

    if (id == 1)
    return Colors.purple;

    if (id == 2)
    return Colors.red;

    if (id == 3)
    return Colors.orange;

    return Colors.yellow;
  } 

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['value'] = value;
  }
}
