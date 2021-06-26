import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/on_boarding/on_boarding_01.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_consts.dart';
import 'auth_pages/login_page.dart';
import 'home_directories/page_home.dart';
import 'model/response_login_model.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {

    // TODO: implement createState
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    /*
    1. isLoggedIn
    1.1 loggedIn -> home page
    1.2 !loggedIn -> login page
    * */

    _isLoggedIn().then((loggedIn) {
      if (loggedIn) {
        if (_fetchUser() != null) {
          Timer(Duration(seconds: 3), () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => HomePage(
                        user: _fetchUser(),
                      )),
            );
          });
        } else {
          Timer(Duration(seconds: 3), () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => OnBoarding01()));
          });
        }
      }else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnBoarding01()));
        });
      }
    });
    super.initState();
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var key = sharedPreferences.getString(PenduConstants.spToken);
    if (key != null) {
      return true;
    }
    return false;
  }

  _fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var str = sharedPreferences.getString(PenduConstants.spUser);
    if (str != null) {
      return User.fromJson(str);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/splash.svg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              child: Image.asset('assets/logo.png'),
            ),
          )
        ],
      ),
    );
  }
}
