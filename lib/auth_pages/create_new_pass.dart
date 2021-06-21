import 'package:flutter/material.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/password_textform_field.dart';

class CreateNewPassword extends StatefulWidget {
  final String  inputMail, otp;
  const CreateNewPassword({Key key, this.inputMail, this.otp}) : super(key: key);

  @override
  _CreateNewPasswordState createState() => _CreateNewPasswordState(inputMail, otp);
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  final String  inputMail, otp;
  _CreateNewPasswordState(this.inputMail, this.otp);
  final _formKey = GlobalKey<FormState>();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  @override
  void dispose() {
    passController.dispose();
    confirmPassController.dispose();
    super.dispose();
  }

  bool validatePassword(String pass) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(pass);
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 20,
        children: [
          PasswordTextFormField(
            validator: (pass) {
              if (pass == null || pass.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            textLabel: "New Password",
            controller: passController,
          ),
          PasswordTextFormField(
            validator: (passCon) {
              if (passCon == null || passCon.isEmpty) {
                return 'Confirm Password is required';
              }
              if (passController.text != confirmPassController.text) {
                return "Password Do not match";
              }
              return null;
            },
            textLabel: "Confirm New Password",
            controller: confirmPassController,
          ),
          AuthButton(
            btnText: 'Set Password',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                //Call reset pass api
                var resetPassApi = CallApi(context);
                resetPassApi.callResetPasswordApi(inputMail: inputMail, otpCode: otp, password: passController.text);
                //Navigate to nest page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LogInPage()));
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
        child: CommonAppBar('New Password'),
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
                'Create New Password to Secure',
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
}
