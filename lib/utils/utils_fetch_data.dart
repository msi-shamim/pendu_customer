import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/model/response_login_model.dart';
import 'package:pendu_customer/on_boarding/on_boarding_01.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchDataUtils{
  final BuildContext context;
  FetchDataUtils(this.context);



  /*
    1. isLoggedIn
    1.1 loggedIn -> home page
    1.2 !loggedIn -> login page
    * */
  validateUser() async {
    _isLoggedIn().then((loggedIn){
      if(loggedIn){
        _fetchUser().then((user){
          if(user != null){
            Timer(Duration(seconds: 3), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage(user: user,)));
            });
          }else{
            Timer(Duration(seconds: 3), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LogInPage()));
            });
          }
        });
      }else{
        Timer(Duration(seconds: 3), () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OnBoarding01()));
        });
      }
    });
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var key = sharedPreferences.getString(PenduConstants.spToken);
    if(key != null){
      return true;
    }
    return false;
  }

  Future<User> _fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var str = sharedPreferences.getString(PenduConstants.spUser);
    if(str != null){
      return User.fromJson(str);
    }
    return null;
  }
}