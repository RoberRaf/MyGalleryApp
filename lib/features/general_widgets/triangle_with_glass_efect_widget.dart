import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TriangleWithGlassEffect extends StatelessWidget {
  const TriangleWithGlassEffect(
      {super.key, this.color, required this.size, this.isRoundCorners = false});
  final Color? color;
  final Size size;
  final bool isRoundCorners;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: isRoundCorners ? TriangleRoundedCourners() : TriangleClipper(),
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                color: (color ?? Colors.grey.shade300).withOpacity(0.55),
                borderRadius: BorderRadius.circular(4.r),
              ),
            )));
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.4937500, size.height * -0.0125000);
    path_0.lineTo(0, size.height);
    path_0.lineTo(size.width, size.height * 0.9937500);
    path_0.lineTo(size.width * 0.4937500, size.height * -0.0125000);
    path_0.close();
    return path_0;
    // canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class TriangleRoundedCourners extends CustomClipper<Path> {
  TriangleRoundedCourners();
  @override
  getClip(Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.1049500, size.height * 0.4339500);
    path_0.cubicTo(
        size.width * 0.0293250,
        size.height * 0.4690500,
        size.width * 0.0496250,
        size.height * 0.5437500,
        size.width * 0.0998500,
        size.height * 0.5608500);
    path_0.cubicTo(
        size.width * 0.3307250,
        size.height * 0.6809750,
        size.width * 0.6340000,
        size.height * 0.8625500,
        size.width * 0.8671250,
        size.height * 0.9813000);
    path_0.cubicTo(
        size.width * 0.9440250,
        size.height * 1.0156500,
        size.width * 1.0138250,
        size.height * 0.9478000,
        size.width * 0.9983000,
        size.height * 0.8940250);
    path_0.cubicTo(
        size.width * 0.9993875,
        size.height * 0.6977937,
        size.width * 1.0031500,
        size.height * 0.3265500,
        size.width * 1.0026500,
        size.height * 0.1091000);
    path_0.cubicTo(
        size.width * 1.0042500,
        size.height * 0.0512000,
        size.width * 0.9254750,
        size.height * 0.0142500,
        size.width * 0.8752000,
        size.height * 0.0474250);
    path_0.cubicTo(
        size.width * 0.6221000,
        size.height * 0.1609500,
        size.width * 0.6826375,
        size.height * 0.1440562,
        size.width * 0.1049500,
        size.height * 0.4339500);
    path_0.close();
    return path_0;
    // canvas.drawPath(path_0, paintFill0);
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}
