import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1

    Paint paint_fill_0 = Paint()
      ..color = const Color.fromARGB(255, 255, 255, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    paint_fill_0.shader = ui.Gradient.linear(
        Offset(size.width * 0.50, size.height * -0.00),
        Offset(size.width * 0.50, size.height * 1.00),
        [Color(0xffa874e6), Color(0xffffffff)],
        [0.00, 1.00]);

    Path path_0 = Path();
    path_0.moveTo(0, size.height * -0.0011534);
    path_0.quadraticBezierTo(size.width * 0.3946959, size.height * -0.0016609,
        size.width * 0.5467640, size.height * -0.0016609);
    path_0.cubicTo(
        size.width * 0.6663017,
        size.height * 0.0006113,
        size.width * 0.6581752,
        size.height * 0.0453864,
        size.width * 0.6595377,
        size.height * 0.0438293);
    path_0.cubicTo(
        size.width * 0.6532847,
        size.height * 0.1376355,
        size.width * 0.7127007,
        size.height * 0.1663668,
        size.width * 0.8972263,
        size.height * 0.1678085);
    path_0.cubicTo(
        size.width * 0.9902920,
        size.height * 0.1690888,
        size.width * 1.0035523,
        size.height * 0.1897116,
        size.width * 1.0008273,
        size.height * 0.2027105);
    path_0.quadraticBezierTo(size.width, size.height * 0.4108189,
        size.width * 0.9975669, size.height * 0.9976932);
    path_0.lineTo(0, size.height * 0.9988466);
    path_0.lineTo(0, size.height * -0.0011534);
    path_0.close();

    canvas.drawPath(path_0, paint_fill_0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
