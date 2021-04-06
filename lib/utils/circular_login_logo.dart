import 'package:flutter/material.dart';

class CircularLoginLogo extends StatelessWidget {
  final String imgPath;
  CircularLoginLogo({this.imgPath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage('$imgPath'), fit: BoxFit.fill),
      ),
    );
  }
}
