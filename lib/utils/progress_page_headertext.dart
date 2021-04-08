import 'package:flutter/material.dart';

class ProgressPageHeader extends StatelessWidget {
  final String text;
  ProgressPageHeader({this.text});
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }
}
