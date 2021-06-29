import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pendu_customer/utils/utils_pendu_theme.dart';

class Announcement extends StatelessWidget {
  Widget _buildSimpleLine({String text}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.circle,
          color: Pendu.color('5BDB98'),
          size: 12,
        ),
        SizedBox(width: 10.0),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/announcement.png'),
            SizedBox(height: 10.0),
            Text('Become a Dropper',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
            SizedBox(height: 10.0),
            _buildSimpleLine(text: 'Simple browser the tasks around you'),
            _buildSimpleLine(text: 'Accept or make an offer'),
            _buildSimpleLine(text: 'Get it done'),
            _buildSimpleLine(text: 'Get paid'),
            SizedBox(height: 10.0),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                    color: Pendu.color('5BDB98'),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                  child: Text(
                    'Join Here',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          ]),
    );
  }
}
