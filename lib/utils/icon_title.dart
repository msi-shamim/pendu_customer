import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconTitle extends StatefulWidget{
  IconData _icon;
  String _title;

  IconTitle(this._icon, this._title);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _IconTitleState(_icon, _title);
  }

}

class _IconTitleState extends State<IconTitle>{
  IconData _icon;
  String _title;


  _IconTitleState(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: [
          Card(
            color: Theme.of(context).accentColor,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Icon(_icon, size: 64, color: Colors.white,),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(_title),
          )
        ],
      ),
    );
  }
}