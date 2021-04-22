import 'package:flutter/material.dart';

class CurrentLocationPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.location_on_rounded),
          Text(
            "123 County 151 Hwy, Dolgeville, NY, 13329",
            style: TextStyle(fontSize: 12, color: Colors.black),
            textAlign: TextAlign.start,
          )
        ],
      ),
    );
  }
}
