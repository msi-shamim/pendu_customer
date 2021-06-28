import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/on_boarding/on_boarding_01.dart';
import 'package:pendu_customer/utils/utils_fetch_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/api_consts.dart';
import 'auth_pages/login_page.dart';
import 'home_directories/page_home.dart';
import 'models/response_login_model.dart';

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
    FetchDataUtils(context).validateUser();
   // CallApi(context).logOut();
    super.initState();
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
