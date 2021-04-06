import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/circular_login_logo.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/normal_textform_field.dart';
import 'package:pendu_customer/utils/password_textform_field.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Shop & Drop'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/on_boarding_1.png'),
              // SvgPicture.asset(
              //   'assets/clip.svg',
              //   //  color: Colors.red,
              // ),
              SizedBox(
                height: 40,
              ),
              NormalTextFormField(
                labelText: 'Email',
              ),
              SizedBox(
                height: 20,
              ),
              PasswordTextFormField(
                labelText: 'Password',
              ),
              SizedBox(
                height: 20,
              ),
              AuthButton(
                btnText: 'Login',
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Remember Me'),
                  InkWell(
                      onTap: () => print('Forgot Password'),
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(color: Pendu.color('5BDB98')),
                      )),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Or login with ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircularLoginLogo(
                    imgPath: 'assets/facebook.png',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircularLoginLogo(
                    imgPath: 'assets/google.jpg',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircularLoginLogo(
                    imgPath: 'assets/apple.png',
                  ),
                ],
              ),
              const Divider(
                height: 20,
                thickness: 2,
                //   indent: 20,
//endIndent: 20,
              ),
              Row(
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
                    onTap: () => print("Register!"),
                    child: Text(
                      "Register!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Pendu.color('5BDB98'),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
