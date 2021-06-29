import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class AuthButtonUtils extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  AuthButtonUtils({this.btnText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Theme.of(context).accentColor,
        ),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
