import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

import 'menu_button_icon.dart';

class ProfileCommonAppbar extends StatelessWidget {
  final String title;
  ProfileCommonAppbar({this.title});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 150,
      color: Pendu.color('1B3149'),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              //todo
              MenuButtonList(),
            ],
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).accentColor,
            ),
          )
        ],
      ),
    );
  }
}
