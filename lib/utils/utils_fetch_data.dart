import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/model/response_login_model.dart';
import 'package:pendu_customer/model/response_post_model.dart';
import 'package:pendu_customer/on_boarding/on_boarding_01.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchDataUtils{
  final BuildContext context;
  FetchDataUtils(this.context);
  var token;
  /*
    1. isLoggedIn
    1.1 loggedIn -> home page
    1.2 !loggedIn -> login page
    * */
  validateUser() async {
    _isLoggedIn().then((loggedIn){
      print('step 1');
      if(loggedIn){
        print('step 2');
        _fetchUser().then((user){
          print('User: $user');
          if(user != null){
            print('step 3');
            Timer(Duration(seconds: 3), () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage(user: user, token: token,)));
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

  getBlogInfo(String blogToken) async {
    ResponseBlogPostModel blogModel =
    await CallApi(context).callBlogPostApi(blogToken);
    print('Status ${blogModel.status}');
    print('BlogModel : ${blogModel.data}');
    return blogModel.data;
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   token = sharedPreferences.getString(PenduConstants.spToken);
    if(token != null){
      return true;
    }
    return false;
  }

  Future<User> _fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var str = sharedPreferences.getString(PenduConstants.spUser);
    print('STR: $str');
    if(str != null){

      return User.fromJson(json.decode(str));
    }
    return null;
  }
}