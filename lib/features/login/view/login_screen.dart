import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/core/theme/text_styles.dart';
import 'package:hu_task/features/login/view/widgets/background_widget.dart';
import 'package:hu_task/features/login/view/widgets/login_container.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(alignment: Alignment.center, children: [
        const BackgroundWidget(),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My\nGallery',
                  style: TStyle.grey50Bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40.h),
                const LoginContainer(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
