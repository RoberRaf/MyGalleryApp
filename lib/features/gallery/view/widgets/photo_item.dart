import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhotoItem extends StatelessWidget {
  const PhotoItem({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 8)
      ],
      image: DecorationImage(image: NetworkImage(img), fit: BoxFit.fill),
    ));
  }
}
