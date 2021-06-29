import 'package:flutter/material.dart';
import 'package:pendu_customer/auth_pages/page_login.dart';
import 'package:pendu_customer/on_boarding/on_boarding_03.dart';
import 'package:pendu_customer/utils/utils_page_indicator.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

import '../home_directories/page_home.dart';

class OnBoarding02 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardState();
  }
}

class _OnBoardState extends State<OnBoarding02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: [
              Image.asset('assets/on_boarding_2.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Collect & Drop',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Post your request. Get offers from Pro\n'
                  'Drivers in no time. Send packages to\n'
                  'friends & Family within your city',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              PageIndicatorUtils(2),
              Container(
                  margin:
                      EdgeInsets.only(left: 48, top: 16, right: 48, bottom: 0),
                  child: RaisedButton(
                    color: Pendu.color('5BDB98'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnBoarding03()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInPage()));
                  },
                  child: Text(
                    'Skip for now',
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ))
            ],
          ),
        ));
  }
}
