import 'package:flutter/material.dart';

class ProductCategories extends StatefulWidget {
  const ProductCategories({Key key}) : super(key: key);

  @override
  _ProductCategoriesState createState() => _ProductCategoriesState();
}

class Category {
  final int id;
  final String title;
  bool isSelect;

  Category({this.id, this.title, this.isSelect});
}

List<Category> _categoryList = [
  Category(id: 1, title: "Groceries", isSelect: false),
  Category(id: 2, title: "Documents", isSelect: false),
  Category(id: 3, title: "Electronis", isSelect: false),
  Category(id: 4, title: "Furniture", isSelect: false),
  Category(id: 5, title: "Cloths", isSelect: false),
  Category(id: 6, title: "Foods", isSelect: false),
  Category(id: 7, title: "Office Staffs", isSelect: false),
  Category(id: 8, title: "Pet", isSelect: false),
  Category(id: 9, title: "Plants", isSelect: false),
  Category(id: 10, title: "Live Food", isSelect: false),
];

class _ProductCategoriesState extends State<ProductCategories> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
