import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:timelines/timelines.dart';

class OrderStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Order status'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        //color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/order_status.png'),
            Text(
              'Estimate Delivery Time',
              style: TextStyle(color: Colors.grey),
            ),
            Text(
              '11:30 am',
              style: TextStyle(fontSize: 24),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              child: Card(
                //  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                elevation: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text('Track order'), Text('ID#25425233254')],
                    ),
                    Divider(
                      height: 20,
                      thickness: 2,
                      indent: 0,
                      endIndent: 0,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimelineTile(
                          contents: Container(
                            padding: EdgeInsets.all(8.0),
                            child: Text('contents'),
                          ),
                          node: TimelineNode(
                            indicator: DotIndicator(),
                            startConnector: SolidLineConnector(),
                            endConnector: SolidLineConnector(),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
//Todo timeline

//Todo Chat Button

                        InkWell(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              width: 60,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.green[50],
                                  // border: Border.all(),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Chat',
                                    style: TextStyle(
                                        color: Colors.green, fontSize: 12.0),
                                  ),
                                  SvgPicture.asset(
                                    'assets/msg.svg',
                                    height: 20.0,
                                    width: 15.0,
                                    color: Colors.green,
                                  ),
                                ],
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

//Button Started
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 2 - 60,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          primary: Pendu.color('5BDB98')),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/home.svg',
                            height: 25.0,
                            width: 25.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 2 + 20,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {},
                      style:
                          ElevatedButton.styleFrom(primary: Colors.orange[200]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/payment.svg',
                            height: 25.0,
                            width: 25.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Release Payment',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
