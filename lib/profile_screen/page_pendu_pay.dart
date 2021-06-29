import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/appbar_profile.dart';
import 'package:pendu_customer/utils/utils_text_bottom_warning.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class PenduPayPage extends StatefulWidget {
  const PenduPayPage({Key key}) : super(key: key);

  @override
  _PenduPayPageState createState() => _PenduPayPageState();
}

class _PenduPayPageState extends State<PenduPayPage> {
  @override
  Widget build(BuildContext context) {
    Widget _buildCard() {
      return Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          height: 200,
          decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              image:
                  DecorationImage(image: AssetImage('assets/card_back.PNG'))),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AUD',
                      style: TextStyle(
                          color: Colors.white54,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      '15.00',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 40),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Pendu Pay',
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildCard(),
              SizedBox(height: 10.0),
              BottomWarringTextUtils(
                  borderColor: Pendu.color('FFEBCF'),
                  textColor: Pendu.color('90A0B2'),
                  text:
                      'Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmodtempor ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, adipiscing elit, sed do eiusmod tempor ut labore et dolore magna aliqua.'),
            ],
          ),
        ),
      ),
    );
  }
}
