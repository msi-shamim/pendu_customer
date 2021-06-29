import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class ButtonProgressUtils extends StatelessWidget {
  final String btnText;
  final Function onPressed;
  ButtonProgressUtils({this.btnText, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Pendu.color('60E99C')),
        onPressed: onPressed,
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
