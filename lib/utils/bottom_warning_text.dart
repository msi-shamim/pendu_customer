import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class BottomWarringText extends StatelessWidget {
  final String text;
  BottomWarringText({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      // margin: const EdgeInsets.symmetric(horizontal: 15),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('EE82EE'), width: 2.0),
          borderRadius: BorderRadius.circular(5.0)),
      child: Text(
        text,
        style: TextStyle(color: Colors.red[400], fontSize: 15),
        textAlign: TextAlign.center,
      ),
    );
  }
}
