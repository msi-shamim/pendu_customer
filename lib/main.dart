import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/payment_history.dart';
import 'package:pendu_customer/profile_screen/privacy_policy.dart';
import 'package:pendu_customer/profile_screen/pro_driver.dart';
import 'package:pendu_customer/profile_screen/terms_conditions.dart';

import 'package:pendu_customer/utils/pendu_theme.dart';

import 'Screen/progress_page_1.dart';
import 'Screen/request_quote.dart';
import 'home_directories/page_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
      home: HomePage(),
    );
  }
}
