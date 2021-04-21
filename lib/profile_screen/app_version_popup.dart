import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class AppVersionPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  Widget dialogContent(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 0.0, right: 0.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 18.0, left: 10.0),
            margin:
                EdgeInsets.only(top: 13.0, right: 8.0, left: 8.0, bottom: 13.0),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/app version.svg',
                  height: 50,
                  width: 50,
                  color: Theme.of(context).accentColor,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Your app is up to date',
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  '03.25.251.0003',
                  style: TextStyle(color: Pendu.color('90A0B2')),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5.0),
                Text(
                  "Last updated Oct'20, 2020",
                  style: TextStyle(color: Pendu.color('1B3149'), fontSize: 12),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Positioned(
              right: 5,
              top: 10,
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35.0),
                ),
                child: ClipOval(
                  child: Material(
                    color: Colors.transparent, // button color
                    child: InkWell(
                      splashColor: Colors.red, // inkwell color
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Icon(
                          Icons.close,
                          color: Colors.black,
                          size: 19,
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
