import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class MenuButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.0),
      decoration: BoxDecoration(
          border: Border.all(),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          )),
      //height: 50,
      //width: 90,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Logout', style: TextStyle(fontSize: 12)),
              SvgPicture.asset(
                'assets/signout.svg',
                height: 15.0,
                width: 15.0,
                color: Pendu.color('60E99C'),
              )
            ],
          ),
          SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Help & Support',
                style: TextStyle(fontSize: 12),
              ),
              SvgPicture.asset(
                'assets/help_support.svg',
                height: 15.0,
                width: 15.0,
                color: Pendu.color('60E99C'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
