import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

enum DeliveryType { shop_drop, collect_deliver }

class TaskModel {
  final String driverName;
  final String imgUrl;
  final String date;
  final String time;
  final String discription;
  final DeliveryType deliverType;
  final String productList;
  final double rattings;
  final double deliveryCharge;
  TaskModel(
      {this.driverName,
      this.imgUrl,
      this.date,
      this.time,
      this.discription,
      this.deliverType,
      this.productList,
      this.rattings,
      this.deliveryCharge});
}

List<TaskModel> _taskList = [
  TaskModel(
      driverName: 'Devid L.',
      imgUrl:
          'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
      date: '15 Nov 2020',
      time: '16:40',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.shop_drop,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      deliveryCharge: 10,
      rattings: 5.00),
  TaskModel(
      driverName: 'Devid L.',
      imgUrl:
          'https://cdn.fastly.picmonkey.com/contentful/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=800&q=70',
      date: '15 Nov 2020',
      time: '16:40',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.collect_deliver,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      deliveryCharge: 10,
      rattings: 5.00),
];

class TaskInProgress extends StatefulWidget {
  @override
  _TaskInProgressState createState() => _TaskInProgressState();
}

class _TaskInProgressState extends State<TaskInProgress> {
  _cornarText(TaskModel historyVar) {
    switch (historyVar.deliverType) {
      case DeliveryType.shop_drop:
        return Text('Shop & drop', style: TextStyle(color: Colors.white));
        break;
      case DeliveryType.collect_deliver:
        return Text('Collect & deliver', style: TextStyle(color: Colors.white));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          //todo upper button row
          _buildListView(),
        ],
      ),
    ));
  }

  _buildListView() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
      child: ListView.separated(
        separatorBuilder: (BuildContext context, int i2) =>
            SizedBox(height: 10),
        shrinkWrap: true,
        itemCount: _taskList.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [
                //todo header date time
                Row(
                  children: [
                    Text(_taskList[index].date,
                        style: TextStyle(
                            color: Pendu.color('90A0B2'), fontSize: 12))
                  ],
                ),
                //Todo Box
                Container(
                    padding: EdgeInsets.only(
                      left: 5.0,
                      bottom: 5.0,
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Pendu.color('5BDB98')),
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Row(
                      children: [
                        //Todo left user colume
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            _taskList[index].imgUrl),
                                        fit: BoxFit.cover)),
                              ),
                              Text(_taskList[index].driverName),
                              SizedBox(height: 5.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Pendu.color('FFB44A'),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '${_taskList[index].rattings}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //Todo right delivery column
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 120,
                            margin: EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
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
                                            //  topRight: Radius.circular(4.0),
                                            bottomLeft: Radius.circular(5.0),
                                          )),
                                      child: _cornarText(_taskList[index]),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                    height: 25,
                                    alignment: Alignment.topLeft,
                                    child: Text(_taskList[index].discription)),
                                Container(
                                    height: 40,
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      _taskList[index].productList,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 15,
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                          'Delivery charge- \$${_taskList[index].deliveryCharge}'),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: SvgPicture.asset(
                                          'assets/arrow_right.svg'),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
