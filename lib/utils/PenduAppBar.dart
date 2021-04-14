import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PenduAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PenduAppBarState();
  }
}

class _PenduAppBarState extends State<PenduAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(300),
      child: Container(
        color: Theme.of(context).accentColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 4),
          child: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16)),
            ),
            title: Wrap(
              direction: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 2, right: 12, top: 0, bottom: 0),
                  child: Image.asset('assets/logo.png',
                      height: 32,
                      width: 32,
                      color: Theme.of(context).accentColor),
                ),
                Text(
                  'pendu',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 24),
                )
              ],
            ),
            actions: [
              SvgPicture.asset(
                'assets/notification.svg',
                height: 32,
                width: 32,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: 10.0),
              SvgPicture.asset(
                'assets/profile app.svg',
                height: 32,
                width: 32,
                color: Theme.of(context).accentColor,
              ),
              SizedBox(width: 15.0),
            ],
          ),
        ),
      ),
    );
  }
}
