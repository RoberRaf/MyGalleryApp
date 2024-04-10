import 'package:flutter/material.dart';

class DantedShapeWidget extends StatelessWidget {
  const DantedShapeWidget({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: size,
      painter: DantedShape(),
    );
  }
}

class DantedShape extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();

    paint.color = const Color(0xffffffff).withOpacity(0);
    path = Path();
    path.moveTo(size.width * 0.02, size.height * 0.61);
    path.lineTo(size.width * 0.02, size.height * 0.61);
    path.cubicTo(-0.01, size.height * 0.58, -0.02, size.height * 0.48,
        size.width * 0.19, size.height * 0.31);
    path.cubicTo(size.width * 0.28, size.height * 0.24, size.width * 0.3,
        size.height / 5, size.width * 0.3, size.height * 0.08);
    path.cubicTo(size.width * 0.29, -0.01, size.width * 0.57, -0.08,
        size.width * 0.89, size.height * 0.19);
    path.cubicTo(size.width * 1.02, size.height * 0.3, size.width * 1.06,
        size.height * 0.58, size.width * 0.86, size.height * 0.73);
    path.cubicTo(size.width / 2, size.height, size.width * 0.27,
        size.height * 1.08, size.width * 0.16, size.height * 0.91);
    path.cubicTo(size.width * 0.11, size.height * 0.84, size.width * 0.15,
        size.height * 0.76, size.width * 0.11, size.height * 0.68);
    path.cubicTo(size.width * 0.1, size.height * 0.66, size.width * 0.06,
        size.height * 0.65, size.width * 0.02, size.height * 0.61);
    path.cubicTo(size.width * 0.02, size.height * 0.61, size.width * 0.02,
        size.height * 0.61, size.width * 0.02, size.height * 0.61);
    canvas.drawPath(path, paint);
    Paint paintStroke = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.01
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
    canvas.drawPath(path, paintStroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
