import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/model/register_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';
import 'api_consts.dart';

class CallApi {
  BuildContext _context;
  CallApi(this._context);

  Future<void> callLoginApi(String _email, String _password) async {
    var loginData = {'email': _email, 'password': _password};

    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      PenduConstants.acceptType: PenduConstants.acceptTypeValue
    };
    var request = http.Request(
        'POST', Uri.parse(PenduConstants.baseUrl + PenduConstants.loginUrl));

    request.body = jsonEncode(loginData);
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      _allocateInSharedPref(_context, await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> callSignUpApi(
      {String name, email, phone, suburb, password}) async {
    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      PenduConstants.acceptType: PenduConstants.acceptTypeValue
    };
    var request = http.Request(
        'POST', Uri.parse(PenduConstants.baseUrl + PenduConstants.registerUrl));

    // request.body = json.encode({_registrationModel.toJson()});
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
      print(await response.stream.bytesToString());
      print(response.statusCode);

      callLoginApi(email, password);
      // callLoginApi(
      //     _registrationModel.user.email, _registrationModel.user.password);
    } else {
      print("*****");
      print(response.reasonPhrase);
      print("#####");
      print(response.statusCode);
    }
  }

  Future<RegisterModel> callProfileInfoApi({String accessTokenValue}) async {
    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      PenduConstants.acceptType: PenduConstants.acceptTypeValue,
      PenduConstants.accessToken:
          accessTokenValue //access_token: accessTokenValue
    };

    var request = http.Request('GET',
        Uri.parse(PenduConstants.baseUrl + PenduConstants.userProfileUrl));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      var res = await response.stream.bytesToString();
      final registerModel = registerModelFromJson(res);
      return registerModel;
    }
    return null;
  }

  Future<void> callMailApi({String mail}) async {
    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      //PenduConstants.acceptType: PenduConstants.acceptTypeValue,
    };

    var request = http.Request(
        'POST', Uri.parse(PenduConstants.baseUrl + PenduConstants.sendMailUrl));
    request.body = json.encode({"email": mail});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> callVerifyMailApi({String inputMail,otpCode}) async {
    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      PenduConstants.acceptType: PenduConstants.acceptTypeValue,
    };

    var request = http.Request('POST',
        Uri.parse(PenduConstants.baseUrl + PenduConstants.verifyMailOtpUrl));
    request.body = json.encode({ "email": inputMail, "otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
  Future<void> callResetPasswordApi({String inputMail,otpCode, password}) async {
    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      PenduConstants.acceptType: PenduConstants.acceptTypeValue,
    };

    var request = http.Request('PUT',
        Uri.parse(PenduConstants.baseUrl + PenduConstants.changePasswordUrl));
    request.body = json.encode({ "email": inputMail,"password": password, "otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<void> callVerifyPhoneApi({String otpCode}) async {
    var headers = {
      PenduConstants.contentType: PenduConstants.contentTypeValue,
      PenduConstants.acceptType: PenduConstants.acceptTypeValue,
    };

    var request = http.Request('POST',
        Uri.parse(PenduConstants.baseUrl + PenduConstants.verifyPhoneUrl));
    request.body = json.encode({"otp": otpCode});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}

//Profile Info Method

void _allocateInSharedPref(BuildContext context, String s) async {
  print(s);

  var uuid = Uuid();
  var token = uuid.v5(Uuid.NAMESPACE_URL, PenduConstants.baseUrl);

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.setString(PenduConstants.spUser, s);
  await sharedPreferences.setString(PenduConstants.spToken, token);

  if (sharedPreferences.getString(PenduConstants.spToken) != null) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }
}
