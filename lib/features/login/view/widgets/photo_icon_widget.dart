import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/features/general_widgets/triangle_with_glass_efect_widget.dart';

class PhotoIconWidget extends StatelessWidget {
  const PhotoIconWidget({super.key, this.isSingleTriangle = true});
  final bool isSingleTriangle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: isSingleTriangle ? null : 85.h,
      width: isSingleTriangle ? 105.w : null,
      child: Stack(
        children: [
          Container(
            height: isSingleTriangle ? 84.h : 78.h,
            width: isSingleTriangle ? 90.w : 97.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.r),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFFEB5757), Color(0xFFFDB2B2)]),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(top: 13.h, left: 13.w),
              child: CircleAvatar(
                  radius: isSingleTriangle ? 8.r : 7.r,
                  backgroundColor: Colors.white)),
          if (isSingleTriangle)
            Positioned(
                top: 15.h,
                right: 0,
                child: TriangleWithGlassEffect(
                  size: Size(48.w, 54.h),
                  isRoundCorners: true,
                ))
          else ...[
            Positioned(
                bottom: 0,
                left: 5,
                child: TriangleWithGlassEffect(size: Size(53.w, 39.h))),
            Positioned(
                bottom: 0,
                right: 0,
                child: TriangleWithGlassEffect(size: Size(68.w, 48.h))),
          ]
        ],
      ),
    );
  }
}
