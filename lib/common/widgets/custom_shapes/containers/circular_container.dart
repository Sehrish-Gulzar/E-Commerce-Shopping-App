import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class SgCircularContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget? child;
  final double radius;
  final EdgeInsets? padding;
  final Color backgroundColor;
  final EdgeInsets? margin;

  const SgCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.child,
      this.backgroundColor = SgColors.white,
      this.padding,
      this.radius = 400,
      this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius), color: backgroundColor),
      child: child,
    );
  }
}
