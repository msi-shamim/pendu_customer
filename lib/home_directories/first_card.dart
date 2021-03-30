import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/icon_title.dart';

class FirstCard extends StatefulWidget{


  @override
  State<StatefulWidget> createState() => _FirstCardState();

}

class _FirstCardState extends State<FirstCard>{
  @override
  Widget build(BuildContext context) => Card(
    elevation: 4,
    child: Column(
      children: [
        Container(
            margin: EdgeInsets.all(16),
            child: Text(
              'What you’d like to get delivered?',
              style: TextStyle(fontSize: 18),
            )),
        Container(
          margin: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconTitle(Icons.shopping_bag_outlined, 'Shop & Drop'),
              IconTitle(
                  Icons.card_giftcard_outlined, 'Collect & Delivery'),
              IconTitle(Icons.directions_car_outlined, 'Movers'),
            ],
          ),
        )
      ],
    ),
  );
}