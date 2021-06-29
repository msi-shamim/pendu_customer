import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/api/api_consts.dart';
import 'package:pendu_customer/auth_pages/page_login.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
          child: InkWell(
            onTap: () {
              Future<SharedPreferences> sharedPref =
                  SharedPreferences.getInstance();
              sharedPref.then((value) {
                value.remove(PenduConstants.spUser);
                value.remove(PenduConstants.spToken);
                Navigator.pushReplacement<void, void>(context,
                    MaterialPageRoute(builder: (context) => LogInPage()));
              });
            },
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
        ),
        PopupMenuItem(
            value: 1,
            child: InkWell(
              onTap: () {},
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
              ),
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
