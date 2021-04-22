import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/Screen/progress_page_2.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class DropupPointPopUP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(-1, -3),
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Select your dropup location'),

          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Pendu.color('F1FBF5'),
                border: Border.all(color: Pendu.color('5BDB98'))),
            child: Row(children: [
              Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Pendu.color('D6D6D6')),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: SvgPicture.asset(
                    'assets/motorcycle.svg',
                    height: 20,
                    width: 20,
                    color: Pendu.color('5BDB98'),
                  )),
              Container(
                  width: 220,
                  margin: EdgeInsets.only(left: 15.0),
                  child: Text(
                    '2103 N Main St, Highlands, TX, 77562',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ))
            ]),
          ),

          SizedBox(height: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            height: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Pendu.color('F1F1F1'),
                border: Border.all(color: Pendu.color('F1FBF5'))),
            child: Row(children: [
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Pendu.color('D6D6D6')),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Icon(Icons.home, color: Pendu.color('5BDB98')),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15.0),
                  width: 220,
                  child: Text(
                    '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka 1204',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.black),
                  ))
            ]),
          ),

          Spacer(),
          //BUtton
          SizedBox(
            width: MediaQuery.of(context).size.width - 50,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgressPage2()),
                );
              },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: Pendu.color('60E99C'),
                onPrimary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                // side: BorderSide(
                //   color: Pendu.color('90A0B2'),
                // ),
              ),
              child: Text('Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}
