import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePageIcon extends StatelessWidget {
  String iconpath;
  String title;

  HomePageIcon({this.iconpath, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                iconpath,
                height: 50.0,
                width: 40.0,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}
