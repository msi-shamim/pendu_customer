import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PenduAppBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PenduAppBarState();
  }
}

class _PenduAppBarState extends State<PenduAppBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16))
      ),
      title: Wrap(
        direction: Axis.horizontal,
        children: [
          Image.asset('assets/logo.png', height: 32, width: 32),
          Text(
            'pendu',
            style:
                TextStyle(color: Theme.of(context).accentColor, fontSize: 24),
          )
        ],
      ),
      actions: [
        IconButton(
            icon: Icon(Icons.notifications_none_rounded),
            onPressed: () => null),
        IconButton(
            icon: Icon(Icons.account_circle_outlined), onPressed: () => null),
      ],
    );
  }
}
