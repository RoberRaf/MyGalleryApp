import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/core/theme/text_styles.dart';

class MainButton extends StatelessWidget {
  const MainButton(
      {super.key,
      required this.title,
      required this.onPressed,
      this.icon,
      this.bgColor,
      this.textStyle,
      this.borderRadius,
      this.padding});
  final String title;
  final Widget? icon;
  final void Function() onPressed;
  final Color? bgColor;
  final TextStyle? textStyle;
  final double? borderRadius;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: bgColor ?? Colors.white,
      padding:
          padding ?? EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius ?? 20.r)),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!, SizedBox(width: 15.w)],
          Text(title, style: textStyle ?? TStyle.grey20SemiBold),
        ],
      ),
    );
  }
}
