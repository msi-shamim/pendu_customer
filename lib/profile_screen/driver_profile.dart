import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rating_bar/rating_bar.dart';

import 'menu_button_icon.dart';

enum DeliveryType { shop_drop, collect_deliver }

class RecentDeliveryModel {
  final String date;
  final String time;
  final String discription;
  final DeliveryType deliverType;
  final String productList;
  final double rattings;
  RecentDeliveryModel(
      {this.date,
      this.time,
      this.discription,
      this.deliverType,
      this.productList,
      this.rattings});
}

List<RecentDeliveryModel> _recentDeliveryList = [
  RecentDeliveryModel(
      date: '15 Nov 2020',
      time: '16:40',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.collect_deliver,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
  RecentDeliveryModel(
      date: '15 Nov 2020',
      time: '18:25',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.shop_drop,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
  RecentDeliveryModel(
      date: '15 Nov 2020',
      time: '16:40',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.collect_deliver,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
  RecentDeliveryModel(
      date: '15 Nov 2020',
      time: '18:25',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.shop_drop,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
  RecentDeliveryModel(
      date: '15 Nov 2020',
      time: '16:40',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.collect_deliver,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
  RecentDeliveryModel(
      date: '15 Nov 2020',
      time: '18:25',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.shop_drop,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
];

class DriverProfile extends StatefulWidget {
  @override
  _DriverProfileState createState() => _DriverProfileState();
}

class _DriverProfileState extends State<DriverProfile> {
  double _rating = 3.5;
  _cornarText(RecentDeliveryModel modelVar) {
    switch (modelVar.deliverType) {
      case DeliveryType.shop_drop:
        return Text('Shop & drop', style: TextStyle(color: Colors.white));
        break;
      case DeliveryType.collect_deliver:
        return Text('Collect & deliver', style: TextStyle(color: Colors.white));
        break;
    }
  }

  Widget _buildAppbar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(150),
      //Full Container
      child: Container(
        padding:
            EdgeInsets.only(top: 10, right: 10.0, left: 10.0, bottom: 10.0),
        height: 200,
        color: Pendu.color('1B3149'),
        child: AppBar(
          elevation: 0,
          title: Text('Driver\'s profile'),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          actions: [
            MenuButtonList(),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 38,
                backgroundImage: NetworkImage(
                    'https://cultivatedculture.com/wp-content/uploads/2019/12/LinkedIn-Profile-Picture-Example-Madeline-Mann.jpeg'),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return ListView.separated(
      separatorBuilder: (BuildContext context, int i2) => SizedBox(height: 10),
      shrinkWrap: true,
      itemCount: _recentDeliveryList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: [
              //todo header date time
              Row(
                children: [
                  Text(_recentDeliveryList[index].time,
                      style: TextStyle(
                          color: Pendu.color('90A0B2'), fontSize: 12)),
                  SizedBox(width: 10.0),
                  Text(_recentDeliveryList[index].date,
                      style:
                          TextStyle(color: Pendu.color('90A0B2'), fontSize: 12))
                ],
              ),
              //Todo Box
              Container(
                padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Pendu.color('5BDB98')),
                    borderRadius: BorderRadius.circular(5.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //todo corner box
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10.0),
                          height: 20,
                          width: 120,
                          decoration: BoxDecoration(
                              color: Pendu.color('5BDB98'),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(5.0),
                                bottomLeft: Radius.circular(5.0),
                              )),
                          child: _cornarText(_recentDeliveryList[index]),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.0),
                    //todo Left row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                height: 20,
                                width: 200,
                                alignment: Alignment.topLeft,
                                child: Text(
                                    _recentDeliveryList[index].discription)),
                            SizedBox(height: 10.0),
                            Container(
                                height: 30,
                                width: 200,
                                alignment: Alignment.topLeft,
                                child: Text(
                                    _recentDeliveryList[index].productList))
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 24.0,
                                  color: Pendu.color('FFB44A'),
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '${_recentDeliveryList[index].rattings}',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                            padding: EdgeInsets.only(right: 10.0),
                            child: Image(
                              image: AssetImage('assets/history_img.png'),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: Container(
        color: Pendu.color('1B3149'),
        padding: EdgeInsets.only(bottom: 10),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'David L.',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Category 1'),
                  Text('|'),
                  Text('Category 2'),
                ],
              ),
              SizedBox(height: 30.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Overall rating'),
                  IgnorePointer(
                    child: Container(
                      width: 140,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Pendu.color('E7F8EF'),
                        //border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: RatingBar(
                        onRatingChanged: (rating) => null,
                        initialRating: _rating,
                        filledIcon: Icons.star,
                        emptyIcon: Icons.star,
                        halfFilledIcon: Icons.star_half,
                        isHalfAllowed: true,
                        filledColor: Pendu.color('FFB44A'),
                        emptyColor: Colors.white,
                        halfFilledColor: Pendu.color('FFB44A'),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Todo circle
                  CircularPercentIndicator(
                    radius: 65.0,
                    lineWidth: 7.0,
                    percent: .89,
                    center: new Text(
                      '89%',
                      style: new TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                    ),
                    footer: Text('Average accuracy'),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Pendu.color('5BDB98'),
                  ),

                  CircularPercentIndicator(
                    radius: 65.0,
                    lineWidth: 7.0,
                    percent: .90,
                    center: new Text(
                      '90%',
                      style: new TextStyle(
                          fontWeight: FontWeight.w600, fontSize: 16.0),
                    ),
                    footer: Text('Success rate'),
                    circularStrokeCap: CircularStrokeCap.round,
                    progressColor: Pendu.color('5BDB98'),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recent deliveries',
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(height: 10.0),
              Expanded(child: _buildListView()),
            ],
          ),
        ),
      ),
    );
  }
}
