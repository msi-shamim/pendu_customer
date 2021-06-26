import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:pendu_customer/model/response_register_model.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/utils/auth_button.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/normal_textform_field.dart';
import 'package:pendu_customer/utils/password_textform_field.dart';
import 'package:pendu_customer/utils/snackBar_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();
  final suburbController = TextEditingController();
  final contactController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    contactController.dispose();
    suburbController..dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  bool validatePassword(String pass) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(pass);
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildForm() {
      return Form(
        key: _formKey,
        child: Wrap(
          runSpacing: 20,
          children: [
            NormalTextFormField(
              validator: (fName) {
                if (fName == null || fName.isEmpty) {
                  return 'Name is required';
                }
                return null;
              },
              textLabel: "Name",
              controller: nameController,
              isPhonekey: false,
            ),
            NormalTextFormField(
              validator: (eMail) {
                if (eMail == null || eMail.isEmpty) {
                  return 'Email Name is required';
                } else if (!EmailValidator.validate(eMail)) {
                  return 'Invalid Email';
                }
                return null;
              },
              textLabel: "Email",
              controller: emailController,
              isPhonekey: false,
            ),
            NormalTextFormField(
              validator: (suburb) {
                if (suburb == null || suburb.isEmpty) {
                  return 'Suburb is required';
                }
                return null;
              },
              textLabel: "Suburb",
              controller: suburbController,
              isPhonekey: false,
            ),
            NormalTextFormField(
              validator: (cnt) {
                if (cnt == null || cnt.isEmpty) {
                  return 'Phone number is required';
                }
                if (cnt.length < 9) {
                  return "Please enter valid phone";
                }
                return null;
              },
              textLabel: "Phone",
              controller: contactController,
              isPhonekey: true,
            ),
            PasswordTextFormField(
              validator: (pass) {
                if (pass == null || pass.isEmpty) {
                  return 'Password is required';
                }
                if (pass.length < 8) {
                  return "Password at least 8 character";
                }
                return null;
              },
              textLabel: "Password",
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
              textLabel: "Password",
              controller: confirmPassController,
            ),
            AuthButton(
              btnText: 'Register',
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _signup();
                }
              },
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      );
    }

    Widget _buildBottomRow() {
      return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: Row(
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
                  color: Theme.of(context).accentColor,
                ),
              ),
            ),
          ],
        ),
      );
    }

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
              Image.asset('assets/auth_pic.png'),
              // SvgPicture.asset(
              //   'assets/clip.svg',
              //   //  color: Colors.red,
              // ),
              SizedBox(
                height: 40,
              ),
              _buildForm(),
              _buildBottomRow()
            ],
          ),
        ),
      ),
    );
  }

  void _signup() async {
    ResponseRegisterModel rrm = await CallApi(context).callSignupApi(
      nameController.text.toString(),
      emailController.text.toString(),
      contactController.text.toString(),
      suburbController.text.toString(),
      passController.text.toString(),
    );
    rrm.status == 200
        ? _showSuccessMessage(rrm.message)
        : _showErrorMessage(rrm.message);
  }

  _showSuccessMessage(String msg) {
    SnackBarClass.snackBarMethod(message: msg, context: context);
  }

  _showErrorMessage(String msg) {
    SnackBarClass.snackBarMethod(message: msg, context: context);
  }
}

Widget _sizedBox() {
  return SizedBox(
    height: 16,
  );
}
