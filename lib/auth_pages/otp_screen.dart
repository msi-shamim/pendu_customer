import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pendu_customer/auth_pages/create_new_pass.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  TextEditingController textEditingController = TextEditingController();

  StreamController<ErrorAnimationType> errorController;
  bool fullFill = false;
  bool hasError = false;
  String currentText = "";
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

  // snackBar Widget
  snackBar(String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 2),
      ),
    );
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
                length: 5,
                obscureText: true,
                //obscuringCharacter: '*',

                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) {
                  if (v.length < 5) {
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
                  fieldHeight: 50,
                  fieldWidth: 50,
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
                  print("Completed");
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
                  print("Allowing to paste $text");
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
                onPressed: () => snackBar("OTP resend to your mail!"),
                child: Text(
                  "RESEND",
                  style: TextStyle(
                      color: Pendu.color('91D3B3'),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ))
          ],
        ),
        AuthButton(
          btnText: 'Confirm',
          onPressed: () {
            if (fullFill) {
              formKey.currentState.validate();
              // conditions for validating
              if (currentText.length != 5 || currentText != "12345") {
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CreateNewPassword()));
                  },
                );
              }
            } else {
              snackBar("Fill all the field");
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
        child: CommonAppBar('OTP'),
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
                'Enter OTP We Just Sent to Your Email',
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
