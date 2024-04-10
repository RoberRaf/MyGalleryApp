import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/core/theme/text_styles.dart';

class MainTextField extends StatefulWidget {
  const MainTextField(
      {super.key,
      required this.controller,
      required this.enabled,
      this.isLoading = false,
      this.hintText,
      this.label,
      this.style,
      this.onChange,
      this.validator,
      this.suffix,
      this.prefix,
      this.hieght,
      this.width,
      this.isPassword = false,
      this.foucusedColor,
      this.bgColor,
      this.isFilled = true,
      this.inputFormatters,
      this.padding,
      this.iconsConstraints});
  final TextEditingController controller;
  final String? hintText;
  final String? label;
  final TextStyle? style;
  final bool enabled;
  final bool isLoading;
  final Function(String)? onChange;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final double? hieght;
  final double? width;
  final Color? foucusedColor;
  final bool isPassword;
  final bool isFilled;
  final Color? bgColor;
  final FilteringTextInputFormatter? inputFormatters;
  final EdgeInsets? padding;
  final BoxConstraints? iconsConstraints;

  @override
  State<MainTextField> createState() => _MainTextFieldState();
}

class _MainTextFieldState extends State<MainTextField> {
  late final ValueNotifier<bool> isObscure;
  @override
  void initState() {
    isObscure = ValueNotifier<bool>(widget.isPassword);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final iconContraints = widget.iconsConstraints ??
        BoxConstraints(
            minHeight: 25.h, maxHeight: 40.h, maxWidth: 40.w, minWidth: 25.w);
    return SizedBox(
        width: (widget.width ?? double.infinity).w,
        child: widget.isLoading
            ? SizedBox(
                height: (widget.hieght ?? 50).h,
                child: const CircularProgressIndicator(color: Colors.green))
            : ValueListenableBuilder(
                valueListenable: isObscure,
                builder: (context, value, child) => TextFormField(
                  controller: widget.controller,
                  enabled: widget.enabled,
                  style: widget.style ?? TStyle.grey16SemiBold,
                  validator: widget.validator,
                  onChanged: widget.onChange,
                  obscureText: value,
                  inputFormatters: widget.inputFormatters != null
                      ? [widget.inputFormatters!]
                      : null,
                  keyboardType: widget.inputFormatters ==
                          FilteringTextInputFormatter.digitsOnly
                      ? TextInputType.number
                      : TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: widget.padding,
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle: widget.style ?? TStyle.grey16SemiBold,
                    label: widget.label == null
                        ? null
                        : Text(widget.label!, style: TStyle.grey16SemiBold),
                    prefixIcon: widget.prefix,
                    suffixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 7.w),
                        child: widget.isPassword
                            ? InkWell(
                                onTap: () => isObscure.value = !value,
                                child: Icon(
                                    value
                                        ? CupertinoIcons.eye_slash_fill
                                        : CupertinoIcons.eye_fill,
                                    color: Colors.grey,
                                    size: 25.h),
                              )
                            : widget.suffix),
                    prefixIconConstraints: iconContraints,
                    suffixIconConstraints: iconContraints,
                    filled: widget.isFilled || widget.bgColor != null,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.h),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.h),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.h),
                      borderSide: BorderSide.none,
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.h),
                      borderSide: BorderSide.none,
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22.h),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ));
  }
}
