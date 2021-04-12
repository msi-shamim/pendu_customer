import 'package:flutter/material.dart';
import 'package:pendu_customer/Screen/checkout.dart';
import 'package:pendu_customer/Screen/progress_page_1.dart';
import 'package:pendu_customer/Screen/progress_page_2.dart';
import 'package:pendu_customer/Screen/received_offers.dart';
import 'package:pendu_customer/Screen/request_status.dart';
import 'package:pendu_customer/Screen/screen_progress.dart';
import 'package:pendu_customer/auth_pages/login_page.dart';
import 'package:pendu_customer/auth_pages/register_page.dart';
import 'package:pendu_customer/splash_screen.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/paymnet_release_popup2.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

import 'Screen/order_status.dart';
import 'Screen/payment_done.dart';
import 'utils/payment_release_popup.dart';
import 'Screen/progress_page_3.dart';
import 'Screen/request_status_error.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pendu',
      theme: Pendu.lightTheme,
      home: PaymentReleased(),
    );
  }
}
