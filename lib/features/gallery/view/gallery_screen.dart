import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/features/gallery/provider/gallery_provider.dart';
import 'package:hu_task/features/gallery/view/widgets/gallery_layout.dart';
import 'package:hu_task/features/gallery/view/widgets/photo_item.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GalleryLayout(
      child: FutureBuilder(
          future: context.read<GalleryProvider>().getImages(),
          builder: (context, snapshot) {
            return Consumer<GalleryProvider>(builder: (context, value, child) {
              if (snapshot.connectionState == ConnectionState.waiting ||
                  value.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return GridView.builder(
                  padding: EdgeInsets.only(top: 20.h),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 25.w,
                    mainAxisSpacing: 25.h,
                  ),
                  itemCount: value.images.length,
                  itemBuilder: (context, index) {
                    return PhotoItem(img: value.images[index]);
                  },
                );
              }
            });
          }),
    );
  }
}
