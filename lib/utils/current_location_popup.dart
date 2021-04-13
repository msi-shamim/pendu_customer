import 'package:flutter/material.dart';

class CurrentLocationPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.only(bottom: _height - 40, left: 35.0, right: 35.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.location_on_rounded),
            Expanded(
              child: Text(
                "123 County 151 Hwy, Dolgeville, NY, 13329",
                style: TextStyle(fontSize: 12, color: Colors.black),
                textAlign: TextAlign.start,
              ),
            )
          ],
        ),
      ),
    );
  }
}
