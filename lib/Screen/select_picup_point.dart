import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';

import 'package:pendu_customer/utils/select_picup_point_popup.dart';

class SelectPicupPoint extends StatefulWidget {
  @override
  _SelectPicupPointState createState() => _SelectPicupPointState();
}

class _SelectPicupPointState extends State<SelectPicupPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72),
        child: CommonAppBar('Select Picup Point'),
      ),
      body: Container(
        //Note : Use image for now, Map will be here
        decoration: BoxDecoration(
          color: Colors.black26,
          image: DecorationImage(
            colorFilter: ColorFilter.linearToSrgbGamma(),
            image: AssetImage("assets/map.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //CurrentLocationPopup(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
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
            Expanded(child: PickupPointPopUP()),
          ],
        ),
      ),
    );
  }
}
