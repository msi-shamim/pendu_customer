import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Breadcamp extends StatefulWidget {
  String _title;
  Object _url;

  Breadcamp(this._title, this._url);

  @override
  State<StatefulWidget> createState() => _BreadcrampState(_title, _url);
}

class _BreadcrampState extends State<Breadcamp> {
  String _title;
  Object _url;

  _BreadcrampState(this._title, this._url);

  @override
  Widget build(BuildContext context) => Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              _title,
              style: TextStyle(fontSize: 18.0),
            ),
          )),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => _url));
              },
              child: Text('View more'))
        ],
      );
}
