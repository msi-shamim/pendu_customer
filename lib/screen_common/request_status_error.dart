import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/Screen/progress_page_1.dart';
import 'package:pendu_customer/Screen/progress_page_3.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/model/response_login_model.dart';
import 'package:pendu_customer/utils/bottom_warning_text.dart';
import 'package:pendu_customer/utils/close_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pendu_customer/utils/progress_button.dart';

class RequestStatusError extends StatefulWidget {
  final User user;
  final String token;
  RequestStatusError({@required this.user, @required this.token});
  @override
  _RequestStatusErrorState createState() => _RequestStatusErrorState(user, token);
}

class _RequestStatusErrorState extends State<RequestStatusError> {
  final User user;
  final String token;
  _RequestStatusErrorState(this.user, this.token);
  int _var = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Request Error'),
      ),
      body: SingleChildScrollView(
        child: Container(
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
                        color: Theme.of(context).accentColor,
                        height: 1.0,
                        width: 80.0,
                      ),
                      SvgPicture.asset(
                        'assets/task review.svg',
                        height: 80.0,
                        width: 50.0,
                        color: Pendu.color('E8E8E8'),
                      ),
                      Container(
                        color: Pendu.color('E8E8E8'),
                        height: 1.0,
                        width: 80.0,
                      ),
                      SvgPicture.asset(
                        'assets/going to cloud.svg',
                        height: 80.0,
                        width: 50.0,
                        color: Pendu.color('E8E8E8'),
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
                            (_var == 1)
                                ? Icons.cancel_rounded
                                : Icons.check_circle_rounded,
                            color: Pendu.color('F97A7A'),
                            size: 14,
                          ),
                          Text(
                            'Task in Review',
                            style: TextStyle(
                                fontSize: 12, color: Pendu.color('707070')),
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
                            style: TextStyle(
                                fontSize: 12, color: Pendu.color('707070')),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.warning_rounded,
                        color: Pendu.color('F97A7A'),
                        size: 25,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 290,
                        height: 50,
                        child: Text(
                          'Industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley.',
                          style: TextStyle(
                            color: Pendu.color('F97A7A'),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    height: 40,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(5.0)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Pendu.color('FFCE8A')),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProgressPage1(user: user, token: token,)),
                        );
                      },
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
                        primary: Theme.of(context).accentColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(user: user, token: token,)),
                        );
                      },
                      child: Text(
                        'Home',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
