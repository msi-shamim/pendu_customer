import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  Widget _builtTextField(
      {String title, String svgUrl, String hinText, int maxline = 1}) {
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
            child: Column(
              children: [
                //todo
                _builtTextField(
                    title: 'Name',
                    svgUrl: 'assets/profile.svg',
                    hinText: userVar["name"]),
                _builtTextField(
                    title: 'Email (Optional)',
                    svgUrl: 'assets/mail.svg',
                    hinText: userVar["email"]),
                _builtTextField(
                    title: 'Suburb',
                    svgUrl: 'assets/location.svg',
                    hinText: userVar["suburb"],
                    maxline: 5),
                _builtTextField(
                    title: 'Phone No',
                    svgUrl: 'assets/telephone.svg',
                    hinText: userVar["phone"]),

                _builtTextField(
                    title: 'Password',
                    svgUrl: 'assets/unlock.svg',
                    hinText: '*** *** *** ***'),
                SizedBox(height: 50),

                SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserProfile()));
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
    );
  }
}
