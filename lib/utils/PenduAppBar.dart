import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                  child: Image.asset('assets/logo.png', height: 32, width: 32),
                ),
                Text(
                  'pendu',
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 24),
                )
              ],
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.notifications_none_rounded),
                  onPressed: () => null),
              IconButton(
                  icon: Icon(Icons.account_circle_outlined),
                  onPressed: () => null),
            ],
          ),
        ),
      ),
    );
  }
}
