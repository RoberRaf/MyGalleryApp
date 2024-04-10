import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackgroundColors extends StatelessWidget {
  const BackgroundColors({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 156.w,
          child: Container(
            width: 468.67.w,
            height: 593.69.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000.h),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFEA94D7),
                  blurRadius: 50.h,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 50.h,
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: -50.h,
          child: Container(
            width: 538.67.w,
            height: 683.15.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000.h),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFDADA),
                  blurRadius: 50.h,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 50.h,
                )
              ],
            ),
          ),
        ),
        Positioned(
          left: 90.w,
          child: Container(
            width: 538.67.w,
            height: 683.15.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1000.h),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFDDCDFF),
                  blurRadius: 50.h,
                  blurStyle: BlurStyle.normal,
                  spreadRadius: 50.h,
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: 428.w,
            height: 414.h,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromARGB(0, 255, 255, 255), Colors.white])),
          ),
        ),
      ],
    );
  }
}
