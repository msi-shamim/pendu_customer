import 'package:flutter/cupertino.dart';

import 'utils_open_painter.dart';

class PageIndicatorUtils extends StatelessWidget{
  int dark;
  String clr1, clr2, clr3;

  PageIndicatorUtils(int dark){
    this.dark = dark;
    this.clr1 = dark == 1 ? '5BDB98' :'B4FFD5';
    this.clr2 = dark == 2 ? '5BDB98' :'B4FFD5';
    this.clr3 = dark == 3 ? '5BDB98' :'B4FFD5';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        CustomPaint(
          painter: OpenPainter(clr1, -24),
        ),
        CustomPaint(
          painter: OpenPainter(clr2, 0),
        ),
        CustomPaint(
          painter: OpenPainter(clr3, 24),
        ),
      ],
    );
  }

}