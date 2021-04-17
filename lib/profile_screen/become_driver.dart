import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/profile_common_appbar.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class BecomeDriver extends StatelessWidget {
  Widget _buildSimpleLine({String text}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.circle,
            color: Pendu.color('5BDB98'),
            size: 12,
          ),
          SizedBox(width: 10.0),
          Text(text),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: ProfileCommonAppbar(
            title: 'Become a driver',
          )),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Pendu.color('1B3149'),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 40.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0))),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/announcement.png'),
                  SizedBox(height: 15.0),
                  Text('Become a Dropper',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
                  SizedBox(height: 15.0),
                  _buildSimpleLine(text: 'Simple browser the tasks around you'),
                  _buildSimpleLine(text: 'Accept or make an offer'),
                  _buildSimpleLine(text: 'Get it done'),
                  _buildSimpleLine(text: 'Get paid'),
                  SizedBox(height: 30.0),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 1.5,
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
                      child: Text(
                        'Join Here',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
