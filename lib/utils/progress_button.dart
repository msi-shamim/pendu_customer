import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class ProgressButton extends StatelessWidget {
  final String btnText;
  ProgressButton({this.btnText});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 30,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Pendu.color('60E99C')),
        onPressed: () {},
        child: Text(
          btnText,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
