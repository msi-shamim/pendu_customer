import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class MenuButtonList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
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
    );
  }
}
