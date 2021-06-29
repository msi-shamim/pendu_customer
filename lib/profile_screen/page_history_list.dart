import 'package:flutter/material.dart';

import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

enum DeliveryType { shop_drop, collect_deliver }

class History {
  final String date;
  final String time;
  final String discription;
  final DeliveryType deliverType;
  final String productList;
  final double rattings;
  History(
      {this.date,
      this.time,
      this.discription,
      this.deliverType,
      this.productList,
      this.rattings});
}

List<History> _historyList = [
  History(
      date: '15 Nov 2020',
      time: '16:40',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.collect_deliver,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
  History(
      date: '15 Nov 2020',
      time: '18:25',
      discription: 'Buy some groceries for me-',
      deliverType: DeliveryType.shop_drop,
      productList: "Toothpaste(1X), Apples(1KG), Chips(1Pack)",
      rattings: 5.00),
];

class HistoryListPage extends StatefulWidget {
  @override
  _HistoryListPageState createState() => _HistoryListPageState();
}

class _HistoryListPageState extends State<HistoryListPage> {
  _cornarText(History historyVar) {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarCommonUtils('History'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int i2) =>
              SizedBox(height: 10),
          shrinkWrap: true,
          itemCount: _historyList.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  //todo header date time
                  Row(
                    children: [
                      Text(_historyList[index].time,
                          style: TextStyle(
                              color: Pendu.color('90A0B2'), fontSize: 12)),
                      SizedBox(width: 10.0),
                      Text(_historyList[index].date,
                          style: TextStyle(
                              color: Pendu.color('90A0B2'), fontSize: 12))
                    ],
                  ),
                  //Todo Box
                  Container(
                    padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).accentColor,
                        ),
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
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0),
                                  )),
                              child: _cornarText(_historyList[index]),
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
                                    child:
                                        Text(_historyList[index].discription)),
                                SizedBox(height: 10.0),
                                Container(
                                    height: 30,
                                    width: 200,
                                    alignment: Alignment.topLeft,
                                    child:
                                        Text(_historyList[index].productList))
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 24.0,
                                      color: Pendu.color('FFB44A'),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '${_historyList[index].rattings}',
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
        ),
      ),
    );
  }
}
