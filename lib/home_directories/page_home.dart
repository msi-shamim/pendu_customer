import 'package:carousel_slider/carousel_slider.dart';
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

final List<String> _imageItems = [
  'assets/banner_01.png',
  'assets/banner_02.png',
];

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
          //section 01
          Card(
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
          ),
          //section 02
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: CarouselSlider(
              options: CarouselOptions(
                height: 110,
                initialPage: 0,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
              ),
              items: _imageItems
                  .map((e) => Builder(
                      builder: (context) => Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 6.0),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor),
                            child: Image.asset(e),
                          )))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
