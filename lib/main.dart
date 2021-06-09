import 'package:flutter/material.dart';
import 'package:pendu_customer/profile_screen/pendu_pay.dart';
import 'package:pendu_customer/profile_screen/refer_earn_page.dart';
import 'package:pendu_customer/profile_screen/terms_conditions.dart';
import 'package:pendu_customer/screen_coleect_and_deliver/checkout_collect_drop.dart';
import 'package:pendu_customer/screen_coleect_and_deliver/collect_drop_page_1.dart';

import 'package:pendu_customer/utils/pendu_theme.dart';

import 'Screen/progress_page_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
      home: TermsConditions(),
    );
  }
}
