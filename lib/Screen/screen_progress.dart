import 'package:flutter/material.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class ScreenProgress extends StatelessWidget {
  final int ticks;

  ScreenProgress({@required this.ticks});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 20),
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          tick1(),
          spacer(),
          line(),
          spacer(),
          tick2(),
          spacer(),
          line(),
          spacer(),
          tick3(),
        ],
      ),
    );
  }

  Widget tick(bool isChecked) {
    return isChecked
        ? Icon(
            Icons.check_circle,
            color: Pendu.color('5BDB98'),
          )
        : Icon(
            Icons.radio_button_unchecked,
            color: Colors.grey,
          );
  }

  Widget tick1() {
    return this.ticks > 0 ? tick(true) : tick(false);
  }

  Widget tick2() {
    return this.ticks > 1 ? tick(true) : tick(false);
  }

  Widget tick3() {
    return this.ticks > 2 ? tick(true) : tick(false);
  }

  Widget spacer() {
    return Container(
      width: 5.0,
    );
  }

  Widget line() {
    return Container(
      color: Pendu.color('5BDB98'),
      height: 5.0,
      width: 100.0,
    );
  }
}
