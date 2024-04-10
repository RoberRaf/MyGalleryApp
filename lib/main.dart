import 'package:flutter/material.dart';
import 'package:hu_task/core/di/di.dart';
import 'package:hu_task/core/theme/theming.dart';
import 'package:hu_task/features/login/view/login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      ensureScreenSize: true,
      minTextAdapt: true,
      fontSizeResolver: (fontSize, instance) {
        final width = MediaQuery.sizeOf(context).width;
        final subtractvalue = width < 600 ? 0 : ((width - 600) ~/ 100) + 1;
        return (width > 840
                ? fontSize
                : (width > 600 ? (fontSize - subtractvalue) : fontSize))
            .toDouble();
      },
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheming.theme,
        home: const LoginScreen(),
      ),
    );
  }
}
