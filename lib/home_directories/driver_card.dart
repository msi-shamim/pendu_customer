import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DriverCard extends StatefulWidget {
  String _image;

  DriverCard(this._image);

  @override
  State<StatefulWidget> createState() => _DriverCardState(_image);
}

class _DriverCardState extends State<DriverCard> {
  String _image;

  _DriverCardState(this._image);

  @override
  Widget build(BuildContext context) => Stack(
    children: [
      Container(
        width: 220.0,
        child: Card(
          elevation: 3.0,
          child: Column(
            children: [
              Image.asset(_image, fit: BoxFit.cover, width: MediaQuery.of(context).size.width,),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 32, bottom: 4),
                child: Row(
                  children: [
                    Expanded(child: Text('Success Rate')),
                    Text(
                      '5.00',
                      style: TextStyle(color: Theme.of(context).accentColor),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 8),
                child: Row(
                  children: [
                    Expanded(child: Text('Accuracy Score')),
                    Text('96',
                        style:
                        TextStyle(color: Theme.of(context).accentColor))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 8, right: 8, top: 0, bottom: 8),
                child: RaisedButton(
                  onPressed: () {},
                  color: Theme.of(context).accentColor,
                  child: Text('Request a quote',
                      style: TextStyle(color: Colors.white)),
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        left: 18,
        top: 100,
        child: Card(
          elevation: 3,
          child: Container(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(icon: Icon(Icons.star, color: Colors.amber,), onPressed: (){}),
                Text('4.80', style: TextStyle(fontSize: 18),),
                IconButton(icon: Icon(Icons.directions_car_outlined,), onPressed: (){}),
                IconButton(icon: Icon(Icons.card_giftcard_outlined,), onPressed: (){}),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
