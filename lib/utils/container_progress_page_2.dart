import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class ContainerProgressPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 160,
      height: 120,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(3.0),
      decoration: BoxDecoration(
          border: Border.all(color: Pendu.color('5BDB98'), width: 2.0),
          borderRadius: BorderRadius.circular(5.0)),
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/clip.svg',
            color: Pendu.color('EE82EE'),
            width: 50,
            height: 50,
          ),
          Text(
            'ASAP',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Pendu.color('5BDB98'),
            ),
          )
        ],
      ),
    );
  }
}
