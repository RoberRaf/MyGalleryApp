// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/core/extensions/extensions.dart';
import 'package:hu_task/core/theme/assets.dart';
import 'package:hu_task/core/theme/text_styles.dart';
import 'package:hu_task/features/general_widgets/main_button.dart';
import 'package:hu_task/features/general_widgets/pickers.dart';

class UploadContainer extends StatelessWidget {
  const UploadContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 37.w),
          padding: EdgeInsets.symmetric(vertical: 50.h, horizontal: 31.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade200.withOpacity(0.4),
            borderRadius: BorderRadius.circular(32.r),
            border: Border.all(color: Colors.white, width: 2.w),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MainButton(
                title: 'Gallery',
                textStyle: TStyle.grey27Bold,
                icon: Image.asset(
                  Pngs.gallery,
                  height: 50.h,
                  fit: BoxFit.fitHeight,
                ),
                onPressed: () async {
                  final file = await Picker.pickGalleryImage();
                  if (file != null) {
                    context.myPop(result: file);
                  }
                },
                bgColor: const Color(0XffEFD8F9),
              ),
              SizedBox(height: 45.h),
              MainButton(
                title: 'Camera',
                textStyle: TStyle.grey27Bold,
                icon: Image.asset(
                  Pngs.camera,
                  height: 50.h,
                  fit: BoxFit.fitHeight,
                ),
                onPressed: () async {
                  final file = await Picker.capturePhoto();
                  if (file != null) {
                    context.myPop(result: file);
                  }
                },
                bgColor: const Color(0XffEBF6FF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
