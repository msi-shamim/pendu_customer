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

    var headers = {PenduConstants.contentType: PenduConstants.contentTypeValue};
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

  Future<void> callSignUpApi(RegisterModel _registrationModel) async {
    var headers = {PenduConstants.contentType: PenduConstants.contentTypeValue};
    var request = http.Request(
        'POST', Uri.parse(PenduConstants.baseUrl + PenduConstants.registerUrl));

    request.body = jsonEncode(_registrationModel.toJson());
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      print(response.statusCode);
      //!Email is not working
      callLoginApi(_registrationModel.user.email, _registrationModel.user.name);
    } else {
      print(response.reasonPhrase);
      print(response.statusCode);
    }
  }
}

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
