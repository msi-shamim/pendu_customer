import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/profile_screen/profile.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class MyProfile extends StatefulWidget {
  final dynamic userVar;
  MyProfile({this.userVar});
  @override
  _MyProfileState createState() => _MyProfileState(userVar);
}

class _MyProfileState extends State<MyProfile> {
  final dynamic userVar;
  _MyProfileState(this.userVar);

  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;
  String userName, userEmail, userSuburb, userPhone, userPass;

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

  Widget _builtTextField(
      {String title,
      String svgUrl,
      String hinText,
      int maxline = 1,
      Function validator,
      TextEditingController controller}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgUrl,
              height: 18,
              width: 18,
              color: Theme.of(context).accentColor,
            ),
            SizedBox(width: 5.0),
            Text(title),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          //   height: hight != 0 ? hight : 200,
          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0)),
          child: TextFormField(
            maxLines: (maxline == 1) ? 1 : maxline,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintText: hinText,
              filled: true,
              fillColor: Pendu.color('F9F9F9'),
              border: InputBorder.none,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Pendu.color('F9F9F9'),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              contentPadding:
                  EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Theme.of(context).accentColor,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    userName = userVar["name"];
    userEmail = userVar["email"];
    userSuburb = userVar["suburb"];
    userPhone = userVar["phone"];
    userPass = userVar["password"];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'My profile',
          )),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Pendu.color('1B3149'),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0))),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  //todo
                  _builtTextField(
                      validator: (fName) {
                        if (fName == null || fName.isEmpty) {
                          //return 'Name is required';
                          nameController.text = userName;
                        }
                        return null;
                      },
                      controller: nameController,
                      title: 'Name',
                      svgUrl: 'assets/profile.svg',
                      hinText: userName),
                  _builtTextField(
                      validator: (eMail) {
                        if (eMail == null || eMail.isEmpty) {
                          //return 'Email Name is required';
                          emailController.text = userEmail;
                        } else if (!EmailValidator.validate(eMail)) {
                          return 'Invalid Email';
                        }
                        return null;
                      },
                      controller: emailController,
                      title: 'Email (Optional)',
                      svgUrl: 'assets/mail.svg',
                      hinText: userEmail),
                  _builtTextField(
                      validator: (suburb) {
                        if (suburb == null || suburb.isEmpty) {
                          // return 'Suburb is required';
                          suburbController.text = userSuburb;
                        }
                        return null;
                      },
                      controller: suburbController,
                      title: 'Suburb',
                      svgUrl: 'assets/location.svg',
                      hinText: userSuburb,
                      maxline: 5),
                  _builtTextField(
                      validator: (cnt) {
                        if (cnt == null || cnt.isEmpty) {
                          // return 'Phone number is required';
                          contactController.text = userPhone;
                        }
                        if (cnt.length < 9) {
                          return "Please enter valid phone";
                        }
                        return null;
                      },
                      controller: contactController,
                      title: 'Phone No',
                      svgUrl: 'assets/telephone.svg',
                      hinText: userPhone),

                  _builtTextField(
                      validator: (pass) {
                        if (pass == null || pass.isEmpty) {
                          // return 'Password is required';
                          passController.text = userPass;
                        }
                        if (pass.length < 8) {
                          return "Password at least 8 character";
                        }
                        return null;
                      },
                      controller: passController,
                      title: 'Password',
                      svgUrl: 'assets/unlock.svg',
                      hinText: '*** *** *** ***'),
                  SizedBox(height: 50),

                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          var sighnUpinApi = CallApi(context);
                          // sighnUpinApi.callSignUpApi(RegisterModel(
                          //   user: User(
                          //     name: nameController.text,
                          //     email: emailController.text,
                          //     phone: contactController.text,
                          //     suburb: suburbController.text,
                          //     password: passController.text,
                          //   ),
                          // ));
//
                          sighnUpinApi.callUserInfoUpdateApi(
                            name: nameController.text,
                            email: emailController.text,
                            phone: contactController.text,
                            suburb: suburbController.text,
                            password: passController.text,
                          );
                        }

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => UserProfile()));
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: Theme.of(context).accentColor,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        // side: BorderSide(
                        //   color: Pendu.color('90A0B2'),
                        // ),
                      ),
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
