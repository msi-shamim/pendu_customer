import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/current_location_popup.dart';

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
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: AssetImage("assets/map.png"),
                fit: BoxFit.fill,
              )),
            ),
            Positioned(
              top: 0,
              child: CurrentLocationPopup(),
            ),
            Positioned(bottom: 15, child: PickupPointPopUP()),
          ],
        ));
  }
}
