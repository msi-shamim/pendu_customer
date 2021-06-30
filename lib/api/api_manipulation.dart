import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/api/api_call.dart';
import 'package:pendu_customer/auth_pages/page_login.dart';
import 'package:pendu_customer/auth_pages/page_phone_otp.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/models/response_delivery_time.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/models/response_post_model.dart';
import 'package:pendu_customer/models/response_pro_driver_model.dart';
import 'package:pendu_customer/models/response_product_categories_model.dart';
import 'package:pendu_customer/models/response_recieve_offer_from_driver.dart';
import 'package:pendu_customer/models/response_service_category_model.dart';
import 'package:pendu_customer/on_boarding/on_boarding_01.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiManipulation{
  final BuildContext context;
  ApiManipulation(this.context);
  var token;
  /*
  * loggedIn or not
  * - user null or not
  * - phone verified or not
  * */
  validateUser(){
    _isLoggedIn().then((loggedIn){
      if(loggedIn){
        fetchUser().then((user){
          if(user != null){
            if(user.phoneVerifiedAt != null){
              Timer(Duration(seconds: 3), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage(user: user, token: token,)));
              });
            }else{
              Timer(Duration(seconds: 3), () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => VerifyPhoneNumberPage(token: token,)));
              });
            }
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

  Future<List<Datum>> getBlogs (String blogToken) async{
    ResponseBlogPostModel blogPostModel = await CallApi(context).callBlogPostApi(blogToken);
    return blogPostModel.data;
  }

  Future<List<ProDriverList>> getProDrivers(String token) async {
    ResponseProDriverModel proDriverModel = await CallApi(context).callProDriverApi(token);
    return proDriverModel.proDriverList;
  }

  Future<List<ProductCategoryList>> getProductCategories(String userToken) async {
    ResponseProductCategoryModel productCategory =
    await CallApi(context).callProductCategoryApi(userToken);
    return productCategory.productCategoryList;
  }

  getServiceCategoryInfo(String userToken) async {
    ResponseServiceCategoryModel serviceCategory =
    await CallApi(context).callServiceCategoryApi(userToken);
    return serviceCategory.serviceCategoryList;
  }
  getDeliveryTimeInfo(String userToken) async {
    ResponseDeliveryTime deliveryTime =
    await CallApi(context).callDeliveryTimeApi(userToken);
    return deliveryTime.deliveryTimeList;
  }

  getOffersFromDriverInfo(String userToken, int taskId) async {
    ResponseOffersFromDriver offersFromDriver =
    await CallApi(context).callOffersFromDriverApi(userToken, taskId);
    print('Status ${offersFromDriver.status}');
    print('OffersModel : ${offersFromDriver.offersFromDriverList}');
    return offersFromDriver.offersFromDriverList;
  }

  Future<bool> _isLoggedIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
   token = sharedPreferences.getString(PenduConstants.spToken);
    if(token != null){
      return true;
    }
    return false;
  }

  Future<User> fetchUser() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var str = sharedPreferences.getString(PenduConstants.spUser);
    print('STR: $str');
    if(str != null){
      return User.fromJson(json.decode(str));
    }
    return null;
  }

  refreshUser(String email, String password) async{
    CallApi(context).callLoginApi(email, password);
  }
}