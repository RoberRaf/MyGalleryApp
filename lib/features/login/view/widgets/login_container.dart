import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/core/di/di.dart';
import 'package:hu_task/core/extensions/extensions.dart';
import 'package:hu_task/core/theme/text_styles.dart';
import 'package:hu_task/core/services/validators.dart';
import 'package:hu_task/features/gallery/provider/gallery_provider.dart';
import 'package:hu_task/features/gallery/view/gallery_screen.dart';
import 'package:hu_task/features/general_widgets/main_button.dart';
import 'package:hu_task/features/general_widgets/main_text_field.dart';
import 'package:hu_task/features/login/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginContainer extends StatefulWidget {
  const LoginContainer({super.key});

  @override
  State<LoginContainer> createState() => _LoginContainerState();
}

class _LoginContainerState extends State<LoginContainer> {
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final passController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di<LoginProvider>(),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Text('LOG IN', style: TStyle.grey30Bold),
            SizedBox(height: 38.h),
            MainTextField(
                controller: nameController,
                enabled: true,
                label: 'Email Address',
                validator: Validators.emailValidator),
            SizedBox(height: 38.h),
            MainTextField(
                controller: passController,
                enabled: true,
                label: 'Passwrod',
                isPassword: true,
                validator: Validators.passwordValidator),
            SizedBox(height: 38.h),
          ],
        ),
      ),
      builder: (context, child) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 41.w),
            padding: EdgeInsets.symmetric(vertical: 47.h, horizontal: 31.w),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(32.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                child!,
                Consumer<LoginProvider>(
                  builder: (context, value, child) => value.isLoading
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          child: MainButton(
                            title: 'SUBMIT',
                            onPressed: () async {
                              if (_formKey.currentState?.validate() == false)
                                return;
                              final result = await context
                                  .read<LoginProvider>()
                                  .login(
                                      email: nameController.text,
                                      password: passController.text);
                              if (result) {
                                // ignore: use_build_context_synchronously
                                context.myPushReplacment(ChangeNotifierProvider(
                                    create: (context) => di<GalleryProvider>(),
                                    builder: (context, child) =>
                                        const GalleryScreen()));
                              }
                            },
                            bgColor: const Color(0Xff7BB3FF),
                            textStyle: TStyle.white18Bold,
                            borderRadius: 10.r,
                          ),
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
