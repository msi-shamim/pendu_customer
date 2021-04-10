import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';

class RequestStatus extends StatefulWidget {
  @override
  _RequestStatusState createState() => _RequestStatusState();
}

class _RequestStatusState extends State<RequestStatus> {
  @override
  Widget build(BuildContext context) {
    Widget _rowMiddle() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            'assets/task received.svg',
            height: 50.0,
            width: 30.0,
            color: Colors.yellow,
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle_rounded,
                color: Colors.green,
                size: 14,
              ),
              Text('Task Received'),
            ],
          )
        ],
      );
    }

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Request Status'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                SvgPicture.asset(
                  'assets/payment.svg',
                  height: 200.0,
                  width: 150.0,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/task received.svg',
                          height: 80.0,
                          width: 50.0,
                          color: Colors.yellow,
                        ),
                        Container(
                          color: Pendu.color('5BDB98'),
                          height: 1.0,
                          width: 80.0,
                        ),
                        SvgPicture.asset(
                          'assets/task received.svg',
                          height: 80.0,
                          width: 50.0,
                          color: Colors.yellow,
                        ),
                        Container(
                          color: Pendu.color('5BDB98'),
                          height: 1.0,
                          width: 80.0,
                        ),
                        SvgPicture.asset(
                          'assets/task received.svg',
                          height: 80.0,
                          width: 50.0,
                          color: Colors.yellow,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 14,
                            ),
                            Text(
                              'Task Received',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 14,
                            ),
                            Text(
                              'Task in Review',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 14,
                            ),
                            Text(
                              'Going to the \n network for offers',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: 40,
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.red[200], width: 2.0),
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ElevatedButton(
                        style:
                            ElevatedButton.styleFrom(primary: Colors.red[200]),
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 20,
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Pendu.color('5BDB98')),
                        onPressed: () {},
                        child: Text(
                          'Home',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                BottomWarringText(
                    text:
                        'Quick Tip - we will notify you once your offer is accepted or a new offer is made'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
