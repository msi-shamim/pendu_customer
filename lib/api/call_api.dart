import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/model/response_coupon_model.dart';
import 'package:pendu_customer/model/response_driver_profile_model.dart';
import 'package:pendu_customer/model/response_driver_profile_with_level_model.dart';
import 'package:pendu_customer/model/response_list_task_offers_model.dart';
import 'package:pendu_customer/model/response_login_model.dart';
import 'package:pendu_customer/model/response_mail.dart';
import 'package:pendu_customer/model/response_post_model.dart';
import 'package:pendu_customer/model/response_product_categories_model.dart';
import 'package:pendu_customer/model/response_register_model.dart';
import 'package:pendu_customer/model/response_service_category_model.dart';
import 'package:pendu_customer/model/response_user_profile_model.dart';
import 'package:pendu_customer/model/response_vehical_model.dart';
import 'package:pendu_customer/model/task_collect_drop_model.dart';
import 'package:pendu_customer/model/task_mover_model.dart';
import 'package:pendu_customer/model/task_shop_drop_model.dart';
import 'package:pendu_customer/model/update_user_model.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'api_consts.dart';

class CallApi {
  BuildContext _context;

  CallApi(this._context);

  Future<void> callLoginApi(String email, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://www.pendu.increments.info/api/v1/auth/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      ResponseLogInModel rlm = ResponseLogInModel.fromJson(str);
      print('from Login API: token: ${rlm.data.accessToken}');
      _allocateInSharedPref(
          _context, rlm.data.user.toString(), rlm.data.accessToken);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseRegisterModel> callSignupApi(String name, String email,
      String phone, String suburb, String password) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST',
        Uri.parse('https://www.pendu.increments.info/api/v1/auth/register'));
    request.body = json.encode({
      "name": name,
      "email": email,
      "phone": phone,
      "suburb": suburb,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      ResponseRegisterModel rrm = ResponseRegisterModel.fromJson(str);
      callLoginApi(rrm.data.email, password);
      return rrm;
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<PutUpdateUserModel> callUserInfoUpdateApi(
      String name, String suburb, String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request('PUT',
        Uri.parse('https://www.pendu.increments.info/api/v1/auth/profile'));
    request.body = json.encode({
      "name": name,
      "suburb": suburb,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from User Update : $str');
      return PutUpdateUserModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseUserProfileModel> callGetUserProfileApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request('GET',
        Uri.parse('https://www.pendu.increments.info/api/v1/auth/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from API: $str');
      return ResponseUserProfileModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> callPutUserProfileImgApi(
      String accessTokenValue, String imgPath) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue',
    };
    var request = http.MultipartRequest(
        'PUT',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/auth/profile-image'));
    request.files.add(await http.MultipartFile.fromPath('', imgPath));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Image API: $str');
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<ResponseMailModel> callSendMailApi(String mail) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/auth/password/email'));
    request.body = json.encode({"email": mail});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Response mail: $str');
      return ResponseMailModel.fromJson(str);
    } else {
      return null;
    }
  }

  //Confirm OTP
  Future<void> callConfirmOTPApi(String inputMail, int otpCode) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/auth/password/confirm'));
    request.body = json.encode({"email": inputMail, "otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from verify Mail: $str');
      //return ResponseUserProfileModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      // return null;
    }
  }

  Future<void> callResetPasswordApi(
      String inputMail, String password, int otpCode) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'PUT',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/auth/password/reset'));
    request.body =
        json.encode({"email": inputMail, "password": password, "otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from  ResetPassword: $str');
      //  return ResponseUserProfileModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> callVerifyPhoneApi(int otpCode, String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/auth/verify-phone'));
    request.body = json.encode({"otp": 1234});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from API: $str');
      // return ResponseUserProfileModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseCouponDataModel> callCouponDataApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.pendu.increments.info/api/v1/coupons/'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from product category API: $str');
      return ResponseCouponDataModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseProductCategoryModel> callProductCategoryApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/product-categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from product category API: $str');
      return ResponseProductCategoryModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseServiceCategoryModel> callServiceCategoryApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/service-categories'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from service category API: $str');
      return ResponseServiceCategoryModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseVehiclesDataModel> callVehicleDataApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.pendu.increments.info/api/v1/vehicles'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Vehicle Data API: $str');
      return ResponseVehiclesDataModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseBlogPostModel> callBlogPostApi(String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'GET', Uri.parse('https://www.pendu.increments.info/api/v1/posts'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Blog API: $str');
      return ResponseBlogPostModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseBlogPostModel> callBlogSinglePostApi(
      int blogId, String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/posts/' + '$blogId'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Blog Single API: $str');
      return ResponseBlogPostModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<PostTaskShopDropModel> callTaskShopDropApi(String accessTokenValue,
      title, from, to, notes, int deliveryTimeId, double totalCost) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.pendu.increments.info/api/v1/tasks'));
    request.body = json.encode({
      "title": title,
      "from": from,
      "from_latlng": {"lat": 23.7956037, "lng": 90.3536548},
      "to": to,
      "to_latlng": {"lat": 23.8764744, "lng": 90.39197949999999},
      "notes": notes,
      "total_cost": totalCost,
      "delivery_time_id": deliveryTimeId,
      "products": [
        {"name": "Pepsi 2L", "price": 150, "qty": 4},
        {"name": "Cake 2p", "price": 350, "qty": 2}
      ],
      "product_category_ids": [1, 2, 3],
      "service_category_id": 1
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from shop and drop API: $str');
      return PostTaskShopDropModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<PostTaskCollectDropModel> callTaskCollectDropApi(
      String accessTokenValue,
      title,
      from,
      to,
      notes,
      int deliveryTimeId,
      vehicleId,
      double totalCost) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.pendu.increments.info/api/v1/tasks'));

    request.body = json.encode({
      "title": title,
      "from": from,
      "from_latlng": {"lat": 23.7956037, "lng": 90.3536548},
      "to": to,
      "to_latlng": {"lat": 23.8764744, "lng": 90.39197949999999},
      "total_cost": totalCost,
      "delivery_time_id": deliveryTimeId,
      "products": [
        {"name": "Pepsi 2L", "qty": 4}
      ],
      "product_category_ids": [1, 2, 3],
      "service_category_id": 2,
      "vehicle_id": vehicleId
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from collect & drop API: $str');
      return PostTaskCollectDropModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<PostTaskMoverModel> callTaskMoverApi(String accessTokenValue, title,
      from, to, notes, int deliveryTimeId, vehicleId, double totalCost) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'POST', Uri.parse('https://www.pendu.increments.info/api/v1/tasks'));
    request.body = json.encode({
      "title": title,
      "from": from,
      "from_latlng": {"lat": 23.7956037, "lng": 90.3536548},
      "to": to,
      "to_latlng": {"lat": 23.8764744, "lng": 90.39197949999999},
      "delivery_time_id": deliveryTimeId,
      "products": [
        {"name": "Pepsi 2L", "qty": 4}
      ],
      "product_category_ids": [1, 2, 3],
      "service_category_id": 3,
      "vehicle_id": vehicleId
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from mover task API: $str');
      return PostTaskMoverModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> callCheckOutTaskApi(String accessTokenValue, stripeToken,
      double grandTotal, serviceFee, promoDiscount, int couponId) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/task-checkout/1/offer/1'));
    request.body = json.encode({
      "stripe_token": stripeToken,
      "grand_total": grandTotal,
      "coupon_id": couponId,
      "service_fee": serviceFee,
      "promo_discount": promoDiscount
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Check Out Task API: $str');
      return ResponseBlogPostModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseListTaskOffersModel> callTaskOfferListApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
//todo task number here Ex: 1
    var request = http.Request('GET',
        Uri.parse('https://www.pendu.increments.info/api/v1/tasks/1/offers'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Task Offer List API: $str');
      return ResponseListTaskOffersModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<void> callAcceptOfferApi(String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
//todo offer number here Ex: 1
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/task-checkout/1/offer/1'));
    request.body = '''''';
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Tip  API: $str');
      // return ResponseListTaskOffersModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      //  return null;
    }
  }

  Future<void> callReviewByUserApi(
      String accessTokenValue, reviewText, dynamic rating, accuracy) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/task-order/1/review'));
    request.body = json
        .encode({"rating": rating, "accuracy": accuracy, "review": reviewText});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from user review API: $str');
      // return ResponseListTaskOffersModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      //  return null;
    }
  }

  Future<void> callGivingTipApi(
      String accessTokenValue, String orderNo, double tipAmount) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };
//todo task order number here Ex: 1
    var request = http.Request(
        'POST',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/task-order/$orderNo/tips'));
    request.body = json.encode({"tip_amount": tipAmount});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from Tip API: $str');
      // return ResponseListTaskOffersModel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      //  return null;
    }
  }

  Future<ResponseDriverProfile> callDriverProfileApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };

    var request = http.Request('GET',
        Uri.parse('https://www.pendu.increments.info/api/v1/dropper/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from DriverProfile API: $str');
      return ResponseDriverProfile.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<ResponseDriverProfileLevel> callDriverProfileWithLevelApi(
      String accessTokenValue) async {
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessTokenValue'
    };

    var request = http.Request(
        'GET',
        Uri.parse(
            'https://www.pendu.increments.info/api/v1/dropper/profile?level'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var str = await response.stream.bytesToString();
      print('from DriverProfile API: $str');
      return ResponseDriverProfileLevel.fromJson(str);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}

//Profile Info Method
void _allocateInSharedPref(
    BuildContext context, UStringuser, String token) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  //Todo
  // await sharedPreferences.setString(PenduConstants.spUser, user);
  await sharedPreferences.setString(PenduConstants.spToken, token);
  // print('from shared pref: $user');

  if (sharedPreferences.getString(PenduConstants.spToken) != null) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  } else {
    print('from API: Token null');
  }
}
