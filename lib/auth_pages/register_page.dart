import 'package:flutter/material.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/normal_textform_field.dart';
import 'package:pendu_customer/utils/password_textform_field.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
            mainAxisAlignment: MainAxisAlignment.center,
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
                labelText: 'Name',
              ),
              _sizedBox(), //sized box hight same 16, thats why making function

              NormalTextFormField(
                labelText: 'Email',
              ),
              _sizedBox(),
              NormalTextFormField(
                labelText: 'Suburb',
              ),
              _sizedBox(),
              NormalTextFormField(
                labelText: 'Phone',
              ),
              _sizedBox(),
              PasswordTextFormField(
                labelText: 'Password',
              ),
              _sizedBox(),
              AuthButton(
                btnText: 'Register',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
              ),
              SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account, ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LogInPage())),
                    child: Text(
                      "Login!",
                      style: TextStyle(
                        fontSize: 18,
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

Widget _sizedBox() {
  return SizedBox(
    height: 16,
  );
}
