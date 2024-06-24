import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';

class SgCircularIcon extends StatelessWidget {
  const SgCircularIcon({
    super.key,
    required this.icon,
    this.size = SgSizes.lg,
    this.backgroundColor,
    this.onPressed,
    this.height,
    this.width,
    this.color,
  });

  final double? width, height, size;
  final IconData? icon;
  final Color? color, backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: (backgroundColor != null)
              ? backgroundColor
              : dark
                  ? SgColors.dark.withOpacity(0.9)
                  : SgColors.light.withOpacity(0.9),
          borderRadius: BorderRadius.circular(100)),
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          color: color,
          size: size,
        ),
      ),
    );
  }
}
