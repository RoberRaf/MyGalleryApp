import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// !! widget was not used in the code !! //

class CirclesWidget extends StatelessWidget {
  const CirclesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210.h,
      width: 180.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 20.h,
            right: 15.w,
            child: DecoratedBox(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFFFCD62), Color(0xFFFEA12F)])),
                child: SizedBox(width: 105.r, height: 105.r)),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100.r),
            child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  height: 110.h,
                  width: 110.h,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white10,
                          offset: Offset(0.w, 4.w),
                          blurRadius: 22.w)
                    ],
                  ),
                )),
          ),
          Positioned(
              left: 15.w,
              top: 43.h,
              child: CircleAvatar(
                  radius: 41.5.h, backgroundColor: Colors.white70)),
          Positioned(
              bottom: 15.h,
              right: 15.w,
              child:
                  CircleAvatar(radius: 41.h, backgroundColor: Colors.white70)),
        ],
      ),
    );
  }
}
