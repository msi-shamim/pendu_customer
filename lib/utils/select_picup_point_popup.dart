import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class PickupPointPopUP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(
            left: 20.0, right: 20.0, top: _height / 1.9, bottom: 20.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select your pickup location'),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  // color: Colors.green,
                  border: Border.all(color: Pendu.color('F1FBF5'))),
              child: Row(children: [
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      border: Border.all(color: Pendu.color('D6D6D6')),
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Icon(Icons.home, color: Pendu.color('5BDB98')),
                ),
                SizedBox(width: 10.0),
                Container(
                    width: 210,
                    child: Text(
                      '3/A Jadobpur, Abdul Goli, MD Pur, Dhaka 1204',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black),
                    ))
              ]),
            ),

            Spacer(),
            //BUtton
            Container(
              width: double.infinity - 20,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Pendu.color('60E99C')),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent, elevation: 0.0),
                onPressed: () {},
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
