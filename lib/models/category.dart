class Category {
  int id;
  String value;

  Category(this.value);
  Category.withID(this.id, this.value);

  Category.fromMapObject(Map<String, dynamic> map) {
    id = map['id'];
    value = map['value'];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }

    map['value'] = value;
  }
}

class CategorySeriesObject {
  String category;
  int count;

  CategorySeriesObject(this.category,this.count);
}
