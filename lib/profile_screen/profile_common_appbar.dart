import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

import 'menu_button_icon.dart';

class ProfileCommonAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Pendu.color('1B3149'),
      title: Positioned(
        top: 50,
        left: 50,
        child: Text(
          'My profile',
          style: TextStyle(
            fontSize: 30,
            color: Pendu.color('5BDB98'),
          ),
        ),
      ),
      centerTitle: true,
      leading: Icon(
        Icons.arrow_back_ios,
        color: Colors.white,
      ),
      actions: [
        Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ],
    );
  }
}
