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
  int _var = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Request Status'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Image.asset(
                  'assets/shop_and_drop.png',
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
                          color: Pendu.color('FFB44A'),
                        ),
                        Container(
                          color: Pendu.color('5BDB98'),
                          height: 1.0,
                          width: 80.0,
                        ),
                        SvgPicture.asset(
                          'assets/task review.svg',
                          height: 80.0,
                          width: 50.0,
                          color: Pendu.color('6AD1FF'),
                        ),
                        Container(
                          color: Pendu.color('5BDB98'),
                          height: 1.0,
                          width: 80.0,
                        ),
                        SvgPicture.asset(
                          'assets/going to cloud.svg',
                          height: 80.0,
                          width: 50.0,
                          color: Pendu.color('5BDB98'),
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
                              (_var == 1) ? null : Icons.check_circle_rounded,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              (_var == 1) ? null : Icons.check_circle_rounded,
                              color: Colors.green,
                              size: 14,
                            ),
                            Text(
                              'Going to the \n network for offers',
                              style: TextStyle(fontSize: 12),
                              textAlign: TextAlign.center,
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
                          borderRadius: BorderRadius.circular(5.0)),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Pendu.color('FFCE8A')),
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
                    textColor: Pendu.color('1B3149'),
                    borderColor: Pendu.color('FFCE8A'),
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
