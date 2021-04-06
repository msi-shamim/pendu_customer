import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class AuthButton extends StatelessWidget {
  final String btnText;
  AuthButton({this.btnText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Pendu.color('5BDB98')),
        onPressed: () {},
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
