import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/core/extensions/extensions.dart';
import 'package:hu_task/features/gallery/provider/gallery_provider.dart';
import 'package:hu_task/features/gallery/view/widgets/upload_container.dart';
import 'package:hu_task/features/general_widgets/main_button.dart';
import 'package:hu_task/features/login/provider/login_provider.dart';
import 'package:hu_task/features/login/view/login_screen.dart';
import 'package:provider/provider.dart';

class GalleryButtonsWidget extends StatelessWidget {
  const GalleryButtonsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        MainButton(
            title: 'log out',
            icon: Container(
                width: 33.w,
                height: 28.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xFFC83B3B), Colors.red]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.red.withOpacity(0.3), blurRadius: 5.h)
                    ]),
                child: Icon(Icons.arrow_back, color: Colors.white, size: 15.h)),
            onPressed: () {
              LoginProvider.user = null;
              context.myPushAndRemoveUntil(const LoginScreen());
            }),
        MainButton(
            title: 'Upload',
            icon: Container(
                width: 33.w,
                height: 28.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    gradient: const RadialGradient(
                        colors: [Color(0xFFFFEB38), Color(0xFFFF9900)]),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.yellow.withOpacity(0.3),
                          blurRadius: 5.h)
                    ]),
                child:
                    Icon(Icons.arrow_upward, color: Colors.white, size: 15.h)),
            onPressed: () async {
              final file = await context
                  .myShowDialog<File>(const Center(child: UploadContainer()));
              if (file != null) {
                final result = await context
                    .read<GalleryProvider>()
                    .uploadImage(file.absolute.path);
                if (result) {
                  context.read<GalleryProvider>().getImages();
                }
              }
            })
      ],
    );
  }
}
