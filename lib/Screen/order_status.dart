import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/payment_release_popup.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:timelines/timelines.dart';

class OrderStatus extends StatelessWidget {
  Widget _timeLile() {
    return Wrap(
      children: [
        ///1
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          oppositeContents: null,
          contents: Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            child: Text('Task is assigned'),
          ),
          node: TimelineNode(
            indicator: DotIndicator(
              color: Pendu.color('FFFFFF'),
              child: Icon(
                Icons.check_circle,
                color: Pendu.color('2A8B00'),
              ),
            ),
            // startConnector: DashedLineConnector(color: Pendu.color('60E99C'),),
            endConnector: DashedLineConnector(
              color: Pendu.color('60E99C'),
            ),
          ),
        ),

        ///2
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            child: Text('Task is in the progress'),
            //color: Colors.red,
          ),
          node: TimelineNode(
            indicator: DotIndicator(
              color: Pendu.color('FFFFFF'),
              child: Icon(
                Icons.check_circle,
                color: Pendu.color('FFCE8A'),
              ),
            ),
            startConnector: DashedLineConnector(
              color: Pendu.color('60E99C'),
            ),
            endConnector: DashedLineConnector(
              color: Pendu.color('60E99C'),
            ),
          ),
        ),

        ///3
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            child: Text('Order Collected'),
          ),
          node: TimelineNode(
            indicator: DotIndicator(
              color: Pendu.color('FFFFFF'),
              child: Icon(
                Icons.check_circle,
                color: Pendu.color('F97A7A'),
              ),
            ),
            startConnector: DashedLineConnector(
              color: Pendu.color('60E99C'),
            ),
            endConnector: DashedLineConnector(
              color: Pendu.color('60E99C'),
            ),
          ),
        ),

        ///4
        TimelineTile(
          nodeAlign: TimelineNodeAlign.start,
          contents: Container(
            padding: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 15.0),
            child: Text('Order is delivered'),
          ),
          node: TimelineNode(
            indicator: DotIndicator(
              color: Pendu.color('FFFFFF'),
              child: Icon(
                Icons.check_circle,
                color: Pendu.color('60E99C'),
              ),
            ),
            startConnector: DashedLineConnector(
              color: Pendu.color('60E99C'),
            ),
            // endConnector: DashedLineConnector(
            //   color: Pendu.color('60E99C'),
            // ),
          ),
        ),
      ],
    );
  }

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
                  child: Card(
                    //  margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                    elevation: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Track order'),
                                  Text('ID#25425233254')
                                ],
                              ),
                              Divider(
                                height: 20,
                                thickness: 2,
                                indent: 0,
                                endIndent: 0,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0),
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
//Todo timeline
                              Expanded(child: _timeLile()),

//Todo Chat Button
                              InkWell(
                                onTap: () {},
                                child: Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    width: 60,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.green[50],
                                        // border: Border.all(),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Chat',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 12.0),
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
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

//Button Started
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 60,
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                            );
                          },
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) =>
                                  PaymentReleased(),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Pendu.color('FFCE8A')),
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
                ),
                SizedBox(height: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
