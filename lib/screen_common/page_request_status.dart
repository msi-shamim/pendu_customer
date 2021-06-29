import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/screens/page_received_offers_list.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/screen_common/page_request_status_error.dart';
import 'package:pendu_customer/utils/utils_text_bottom_warning.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class RequestStatusPage extends StatefulWidget {
  final User user;
  final String token;
  RequestStatusPage({@required this.user, @required this.token});
  @override
  _RequestStatusPageState createState() => _RequestStatusPageState(user, token);
}

class _RequestStatusPageState extends State<RequestStatusPage> {
  final User user;
  final String token;
  _RequestStatusPageState( this.user,  this.token);
  int _var = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarCommonUtils('Request Status'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                        color: Pendu.color('6AD1FF'),
                      ),
                      Container(
                        color: Theme.of(context).accentColor,
                        height: 1.0,
                        width: 80.0,
                      ),
                      SvgPicture.asset(
                        'assets/going to cloud.svg',
                        height: 80.0,
                        width: 50.0,
                        color: Theme.of(context).accentColor,
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
                              builder: (context) => RequestStatusErrorPage(user: user,token: token,)),
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
                          MaterialPageRoute(builder: (context) => ReceivedOffers(user: user,token: token,)),
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
              ),
              SizedBox(height: 10),
              BottomWarringTextUtils(
                  textColor: Pendu.color('1B3149'),
                  borderColor: Pendu.color('FFCE8A'),
                  text:
                      'Quick Tip - we will notify you once your offer is accepted or a new offer is made')
            ],
          ),
        ),
      ),
    );
  }
}
