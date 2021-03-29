import 'package:flutter/cupertino.dart';
import 'package:pendu_customer/utils/pendu_theme.dart';

class OpenPainter extends CustomPainter{
  String clr;
  double dx;

  OpenPainter(this.clr,  this.dx);

  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
        ..color = Pendu.color(clr)
        ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(dx, 0), 6.0, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;

}