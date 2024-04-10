import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hu_task/features/login/view/widgets/danted_shape_widget.dart';

// !! widget was not used in the code !! //

class CollectionDantedShape extends StatelessWidget {
  const CollectionDantedShape({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: List.generate(
          6,
          (index) => DantedShapeWidget(
              size: Size(213.w + ((index + 1) * 35).w,
                  204.h + (((index + 1) * 35)).h))),
    );
  }
}
