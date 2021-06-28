import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/models/response_mail.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/normal_textform_field.dart';
import 'package:pendu_customer/utils/snackBar_page.dart';

import 'otp_screen_mail.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 20,
        children: [
          NormalTextFormField(
            validator: (eMail) {
              if (eMail == null || eMail.isEmpty) {
                return 'Email  is required';
              } else if (!EmailValidator.validate(eMail)) {
                return 'Invalid Email';
              }
              return null;
            },
            textLabel: "Email",
            controller: emailController,
            isPhonekey: false,
          ),
          AuthButton(
            btnText: 'Reset',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _onPressed();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Reset Password'),
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
                'Enter your Email to Reset Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  void _onPressed() async {
    ResponseMailModel csm =
        await CallApi(context).callSendMailApi(emailController.text);
    csm.status == 200 ? _moveToNext() : _showErrorMessage(csm.message);
  }

  _moveToNext() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OtpScreenMail(inputMail: emailController.text)));
    SnackBarClass.snackBarMethod(
        message: "OTP send to your Email", context: context);
  }

  _showErrorMessage(String msg) {
    SnackBarClass.snackBarMethod(message: msg, context: context);
  }
}
