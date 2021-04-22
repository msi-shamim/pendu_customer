import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/common_app_bar.dart';
import 'package:pendu_customer/utils/current_location_popup.dart';
import 'package:pendu_customer/utils/select_dropup_point_popup.dart';

import 'package:pendu_customer/utils/select_picup_point_popup.dart';

class SelectDropupPoint extends StatefulWidget {
  @override
  _SelectDropupPointState createState() => _SelectDropupPointState();
}

class _SelectDropupPointState extends State<SelectDropupPoint> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(72),
          child: CommonAppBar('Select Dropup Point'),
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
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.fill,
                    colorFilter: ColorFilter.linearToSrgbGamma(),
                    image: AssetImage(
                      "assets/map.png",
                    ),
                  )),
                ),
                Positioned(
                  top: 0,
                  child: CurrentLocationPopup(),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: DropupPointPopUP()),
              ],
            )));
  }
}
