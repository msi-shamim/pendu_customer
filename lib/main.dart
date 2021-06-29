import 'package:flutter/material.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/profile_screen/page_blog_list.dart';
import 'package:pendu_customer/profile_screen/page_user_profile_menu.dart';
import 'package:pendu_customer/screen_collect_and_deliver/page_collect_drop_1.dart';
import 'package:pendu_customer/splash_screen.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

import 'models/response_login_model.dart';
import 'network_data/api_data_collect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
User user;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
   home: SplashScreen(),
   //   home: UserProfile(user: user,),
    );
  }
}
