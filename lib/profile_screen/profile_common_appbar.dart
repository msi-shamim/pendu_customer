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
              PopupMenuButton(
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
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
                  ),
                  PopupMenuItem(
                      value: 1,
                      child: Row(
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
                      ))
                ],
                //Todo Button click work
                onSelected: (result) {
                  if (result == 0) {
                  } else if (result == 1) {}
                },
              ),
            ],
          ),
          Text(
            title,
            style: TextStyle(fontSize: 30, color: Pendu.color('5BDB98')),
          )
        ],
      ),
    );
  }
}
