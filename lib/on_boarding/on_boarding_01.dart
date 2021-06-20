import 'package:flutter/material.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/on_boarding/on_boarding_02.dart';
import 'package:pendu_customer/utils/page_indicator.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class OnBoarding01 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardState();
  }
}

class _OnBoardState extends State<OnBoarding01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: [
              Image.asset('assets/on_boarding_1.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Shop & Drop',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Simply Make a list of the items you need.'
                  '\nGet offers from the shoppers in minutes',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              PageIndicator(1),
              Container(
                  margin:
                      EdgeInsets.only(left: 48, top: 16, right: 48, bottom: 0),
                  child: RaisedButton(
                    color: Pendu.color('5BDB98'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnBoarding02()));
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
