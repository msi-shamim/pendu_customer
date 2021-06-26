import 'package:flutter/material.dart';
import 'package:pendu_customer/api/call_api.dart';
import 'package:pendu_customer/home_directories/page_home.dart';
import 'package:pendu_customer/profile_screen/blog_page.dart';
import 'package:pendu_customer/profile_screen/profile.dart';
import 'package:pendu_customer/screen_coleect_and_deliver/collect_drop_page_1.dart';
import 'package:pendu_customer/splash_screen.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

import 'network_data/api_data_collect.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
      home: SplashScreen(),
    );
  }
}
