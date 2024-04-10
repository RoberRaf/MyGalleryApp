import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hu_task/core/theme/assets.dart';
import 'package:hu_task/core/theme/text_styles.dart';
import 'package:hu_task/features/gallery/view/widgets/gallery_buttons_widget.dart';
import 'package:hu_task/features/login/provider/login_provider.dart';
import 'package:hu_task/features/login/view/widgets/background_widget.dart';

class GalleryLayout extends StatelessWidget {
  const GalleryLayout({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          const BackgroundWidget(isGallery: true),
          Padding(
            padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
            child: SvgPicture.asset(Svgs.galleryBG, fit: BoxFit.fill),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: EdgeInsets.only(
                  right: 30.w,
                  left: 30.w,
                  top: MediaQuery.paddingOf(context).top + 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10.h),
                        child: Text(
                          'Welcome\n${LoginProvider.user?.name}',
                          style: TStyle.grey32SemiBold.copyWith(),
                        ),
                      ),
                      CircleAvatar(
                        radius: 33.r,
                        backgroundImage: const AssetImage(Pngs.profile),
                      ),
                    ],
                  ),
                  SizedBox(height: 35.h),
                  const GalleryButtonsWidget(),
                  Expanded(child: child),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
