import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class CongratulationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Congratulation !',
          )),
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
                Image.asset('assets/congratulation.png'),
                Text(
                  'Confirmation email has been sent!',
                  style: TextStyle(fontSize: 17),
                ),
                Container(
                  margin: EdgeInsets.only(
                      right: 10.0, left: 10.0, top: 15.0, bottom: 50.0),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Pendu.color('8F8F8F')),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 + 50,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: Pendu.color('5BDB98'),
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // side: BorderSide(
                      //   color: Pendu.color('90A0B2'),
                      // ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/home.svg',
                          height: 30.0,
                          width: 30.0,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          'Home',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
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
