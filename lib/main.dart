import 'package:flutter/material.dart';
import 'package:pendu_customer/splash_screen.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

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
      home: SplashScreen(),
    );
  }
}
