import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/PenduAppBar.dart';
import 'package:pendu_customer/utils/icon_title.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeState();
  }
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: PenduAppBar(),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(16),
        children: [
          Card(
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
                      IconTitle(Icons.card_giftcard_outlined, 'Collect & Delivery'),
                      IconTitle(Icons.directions_car_outlined, 'Movers'),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
