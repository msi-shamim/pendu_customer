import 'package:flutter/material.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/utils/page_indicator.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class OnBoarding03 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardState();
  }
}

class _OnBoardState extends State<OnBoarding03> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16.0),
            children: [
              Image.asset('assets/on_boarding_3.png'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Movers service',
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Need help moving? Post your request.'
                  '\nGet offers from pro movers in your city',
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              PageIndicator(3),
              Container(
                  margin:
                      EdgeInsets.only(left: 48, top: 16, right: 48, bottom: 0),
                  child: RaisedButton(
                    color: Pendu.color('5BDB98'),
                    onPressed: () {
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context)=> HomePage()));
                    },
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
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
