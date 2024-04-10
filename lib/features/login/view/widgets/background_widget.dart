import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hu_task/core/theme/assets.dart';
import 'package:hu_task/features/login/view/widgets/background_colors_widget.dart';
import 'package:hu_task/features/login/view/widgets/photo_icon_widget.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, this.isGallery = false});
  final bool isGallery;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundColors(),
        Positioned(
            left: -72.w,
            top: isGallery ? 85.h : -140.h,
            child: SvgPicture.asset(
              Svgs.dottedShapes,
              width: 371.53.w,
              height: 357.h,
            )),
        if (!isGallery)
          Positioned(
            left: 75.w,
            top: 58.h,
            child: Image.asset(
              Pngs.camera,
              height: 131.56.h,
              width: 131.56.h,
            ),
          ),
        Positioned(
            left: 47.w,
            top: 379.h,
            child: Transform.rotate(
                angle: pi / 6,
                child: const PhotoIconWidget(isSingleTriangle: false))),
        Positioned(
            right: -10.w,
            top: 320.h,
            child: SvgPicture.asset(
              Svgs.circles,
              height: 300.h,
            )),
        Padding(
          padding: EdgeInsets.only(bottom: 165.h),
          child: Align(
              alignment: Alignment.bottomCenter,
              child: Transform.rotate(
                  angle: pi / 7,
                  child: const PhotoIconWidget(isSingleTriangle: true))),
        ),
      ],
    );
  }
}
