import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/auth_pages/page_new_pass.dart';
import 'package:pendu_customer/utils/utils_button_auth.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:pendu_customer/utils/utils_snackBar_message.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreenMail extends StatefulWidget {
  final String inputMail;
  const OtpScreenMail({Key key,this.inputMail}) : super(key: key);

  @override
  _OtpScreenMailState createState() => _OtpScreenMailState(inputMail);
}

class _OtpScreenMailState extends State<OtpScreenMail> {
  final String inputMail;
  _OtpScreenMailState(this.inputMail);
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;
  bool fullFill = false;
  bool hasError = false;
  String currentText ;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
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
                    fullFill = false;

                    return null;
                  } else {
                    fullFill = true;

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
                      hasError ? Colors.amber.shade100 : Colors.red,
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

                    currentText = value;
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
                    message: "OTP resend to your Mail!", context: context),
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
            if (fullFill) {
              formKey.currentState.validate();
              // conditions for validating
              if (currentText.length != 6) {
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                setState(() {
                  hasError = true;
                });
              } else {
                setState(
                  () {
                    hasError = false;
                    // snackBar("OTP Verified!!");

                 //Calling API
                    var otpApi = CallApi(context);
                    otpApi.callConfirmOTPApi( inputMail , int.parse(currentText));
//Route to create password page
                     Navigator.push(
                        context, MaterialPageRoute(
                             builder: (context) => CreateNewPassword(inputMail: inputMail, otp: currentText)));
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
        child: AppBarCommonUtils('OTP'),
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
                'Enter OTP We Just Sent to Your Mail',
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
}
