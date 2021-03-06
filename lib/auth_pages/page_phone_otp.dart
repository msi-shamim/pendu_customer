import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pendu_customer/api/api_call.dart';
import 'package:pendu_customer/auth_pages/page_new_pass.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/models/response_common.dart';
import 'package:pendu_customer/models/response_login_model.dart';
import 'package:pendu_customer/models/response_user_profile_model.dart';
import 'package:pendu_customer/utils/utils_button_auth.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:pendu_customer/utils/utils_snackBar_message.dart';
import 'package:pendu_customer/utils/utils_snack_bar.dart';
import 'package:pendu_customer/api/api_manipulation.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  final String token;

  const VerifyPhoneNumberPage({Key key, this.token}) : super(key: key);

  @override
  _VerifyPhoneNumberPageState createState() => _VerifyPhoneNumberPageState(token);
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  final String token;

  _VerifyPhoneNumberPageState(this.token);

  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;
  bool _fullFill = false;
  bool _hasError = false;
  String _currentText = "";
  User _user = User();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    ApiManipulation(context).fetchUser().then((value){
      if(value != null){
        setState(() {
          _user = value;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    errorController.close();
    textEditingController.dispose();
    super.dispose();
  }

  Widget _buildOtp() {
    return Column(
      children: [
        Form(
          key: formKey,
          child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.amber.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: true,
                //obscuringCharacter: '*',

                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v.length < 6) {
                    _fullFill = false;

                    return null;
                  } else {
                    _fullFill = true;

                    return null;
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 40,
                  fieldWidth: 40,
                  activeColor: Theme.of(context).accentColor,
                  selectedColor: Theme.of(context).primaryColor,
                  disabledColor: Colors.grey,
                  inactiveColor: Colors.black,
                  activeFillColor:
                      _hasError ? Colors.amber.shade100 : Colors.red,
                ),
                cursorColor: Theme.of(context).primaryColor,
                animationDuration: Duration(milliseconds: 300),
                enableActiveFill: false,
                errorAnimationController: errorController,
                controller: textEditingController,
                keyboardType: TextInputType.number,
                boxShadows: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    color: Colors.white,
                    blurRadius: 10,
                  )
                ],
                onCompleted: (v) {
                  //  print("Completed");
                },
                // onTap: () {
                //   print("Pressed");
                // },
                onChanged: (value) {
                  print(value);
                  setState(() {
                    _currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  //  print("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return false;
                },
              )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Didn't receive the code? ",
              style: TextStyle(color: Colors.black54, fontSize: 15),
            ),
            TextButton(
                onPressed: () => SnackBarClass.snackBarMethod(
                    message: "OTP resend to your phone number!",
                    context: context),
                child: Text(
                  "RESEND",
                  style: TextStyle(
                      color: Pendu.color('91D3B3'),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
          ],
        ),
        AuthButtonUtils(
          btnText: 'Confirm',
          onPressed: () {
            if (_fullFill) {
              formKey.currentState.validate();
              // conditions for validating
              if (_currentText.length != 6) {
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                setState(() {
                  _hasError = true;
                });
              } else {
                setState(
                  () {
                    _hasError = false;
                    // snackBar("OTP Verified!!");
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CreateNewPassword()));
                    _checkOtp(int.parse(_currentText), token);
                  },
                );
              }
            } else {
              SnackBarClass.snackBarMethod(
                  message: "Fill all the field", context: context);
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarCommonUtils('Verify Phone Number'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/auth_pic.png'),
              SizedBox(height: 20.0),
              Text(
                'Enter OTP We Just Sent to Your Phone',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              _buildOtp(),
            ],
          ),
        ),
      ),
    );
  }

  void _checkOtp(int parse, String token) async {
    var otpApi = CallApi(context);
    CommonResponse response =
        await otpApi.callVerifyPhoneApi(parse, token);
    if (response.status == 200) {
      bool logout = await CallApi(context).logOut();
      if(logout){
        ApiManipulation(context).validateUser();
      }
    }else{
      ShowSnackBar(context, 'Something went wrong!').show();
    }
  }
}
