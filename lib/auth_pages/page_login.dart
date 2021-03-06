import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/api/api_call.dart';
import 'package:pendu_customer/auth_pages/page_register.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/utils/utils_button_auth.dart';
import 'package:pendu_customer/utils/utils_logo_circular_login.dart';
import 'package:pendu_customer/utils/utils_app_bar_common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/utils_textform_field_normal.dart';
import 'package:pendu_customer/utils/utils_textform_field_password.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'page_forgot_pass.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  final _formKey = GlobalKey<FormState>();
  bool checkValue = false;
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future<SharedPreferences> localStorage = SharedPreferences.getInstance();
    localStorage.then((value) {
      var token = value.getString(PenduConstants.spToken);
      if (token != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    });
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
          TextFormFieldNormalUtils(
            validator: (eMail) {
              if (eMail == null || eMail.isEmpty) {
                return 'Email is required';
              } else if (!EmailValidator.validate(eMail)) {
                return 'Invalid Email';
              }
              return null;
            },
            textLabel: "Email",
            controller: emailController,
            isPhonekey: false,
          ),
          TextFormFieldPasswordUtils(
            validator: (pass) {
              if (pass == null || pass.isEmpty) {
                return 'Password is required';
              }
              return null;
            },
            textLabel: "Password",
            controller: passController,
          ),
          AuthButtonUtils(
            btnText: 'Login',
            onPressed: () {
              if (_formKey.currentState.validate()) {
                // login mechanism
                var callLoginApi = CallApi(context);
                callLoginApi.callLoginApi(
                    emailController.text, passController.text);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //Todo Checkbox
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Transform.scale(
              scale: .9,
              child: Checkbox(
                checkColor: Colors.white,
                activeColor: Theme.of(context).accentColor,
                value: this.checkValue,
                onChanged: (bool value) {
                  setState(() {
                    this.checkValue = value;
                  });
                },
              ),
            ),
            Text('Remember Me'),
          ],
        ),

        InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ForgotPassword())),
            child: Text(
              'Forgot Password?',
              style: TextStyle(
                color: Theme.of(context).accentColor,
              ),
            )),
      ],
    );
  }

  Widget _buildSocialLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Or login with ',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 20,
        ),

        CircularLoginLogoUtils(
          imgPath: 'assets/facebook.png',
        ),
        SizedBox(
          width: 10,
        ),
        CircularLoginLogoUtils(
          imgPath: 'assets/google.jpg',
        ),
        SizedBox(
          width: 10,
        ),
        // CircularLoginLogo(
        //   imgPath: 'assets/apple.png',
        // ),
        SvgPicture.asset(
          'assets/apple.svg',
          height: 28,
          width: 28,
          color: Colors.black,
        ),
      ],
    );
  }

  Widget _buildBottomLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "New User  ",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage())),
          child: Text(
            "Register!",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).accentColor,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: AppBarCommonUtils('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/auth_pic.png'),
              // SvgPicture.asset(
              //   'assets/clip.svg',
              //   //  color: Colors.red,
              // ),
              SizedBox(
                height: 40,
              ),
              _buildForm(),
              SizedBox(
                height: 10,
              ),
              _buildBottomText(),
              SizedBox(
                height: 10,
              ),
              _buildSocialLogin(),
              const Divider(
                height: 20,
                thickness: 2,
                //   indent: 20,
//endIndent: 20,
              ),
              _buildBottomLink(),
            ],
          ),
        ),
      ),
    );
  }
}
