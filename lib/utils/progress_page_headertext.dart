import 'package:flutter/material.dart';

class ProgressPageHeader extends StatelessWidget {
  final String text;
  ProgressPageHeader({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      textAlign: TextAlign.start,
    );
  }
}
