import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  Widget _builtTextField(
      {String title, String svgUrl, String hinText, double hight = 0}) {
    return Column(
      children: [
        Row(
          children: [
            SvgPicture.asset(
              svgUrl,
              height: 18,
              width: 18,
              color: Pendu.color('5BDB98'),
            ),
            SizedBox(width: 5.0),
            Text(title),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          height: hight != 0 ? hight : 40,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hinText,
              filled: true,
              fillColor: Pendu.color('F9F9F9'),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.red,
                  )),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Pendu.color('5BDB98'),
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
          preferredSize: Size.fromHeight(150), child: ProfileCommonAppbar()),
      body: SingleChildScrollView(
        child: Container(
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
            child: Column(
              children: [
                //todo
                _builtTextField(
                    title: 'Name',
                    svgUrl: 'assets/profile.svg',
                    hinText: 'John'),
                _builtTextField(
                    title: 'Email (Optional)',
                    svgUrl: 'assets/mail.svg',
                    hinText: 'Enter Your mail'),
                _builtTextField(
                    title: 'Suburb',
                    svgUrl: 'assets/location.svg',
                    hinText: 'Enter your suburb',
                    hight: 70),
                _builtTextField(
                    title: 'Phone No',
                    svgUrl: 'assets/telephone.svg',
                    hinText: '+880'),

                _builtTextField(
                    title: 'Password',
                    svgUrl: 'assets/unlock.svg',
                    hinText: '*** *** *** ***'),
                SizedBox(height: 50),
                InkWell(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Pendu.color('5BDB98')),
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
