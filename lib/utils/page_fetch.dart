import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/model/response_login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FetchPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _FetchState();

}

class _FetchState extends State<FetchPage>{

  @override
  void initState() {
    /*
    1. isLoggedIn
    1.1 loggedIn -> home page
    1.2 !loggedIn -> login page
    * */

    _isLoggedIn().then((loggedIn) {
      if(loggedIn){

        if(_fetchUser() != null){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage(user: _fetchUser(),)),
          );
        }else{
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LogInPage()),
          );
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var key = sharedPreferences.getString(PenduConstants.spToken);
    if(key != null){
      return true;
    }
    return false;
  }

  _fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var str = sharedPreferences.getString(PenduConstants.spUser);
    if(str != null){
      return User.fromJson(str);
    }
    return null;
  }
}