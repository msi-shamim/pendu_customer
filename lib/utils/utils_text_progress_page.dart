import 'package:flutter/material.dart';

class ProgressPageHeaderTextUtils extends StatelessWidget {
  final String text;
  ProgressPageHeaderTextUtils({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      textAlign: TextAlign.start,
    );
  }
}
