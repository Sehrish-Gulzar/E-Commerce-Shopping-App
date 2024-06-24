import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';
import 'brand_title.dart';

class SgBrandTitleWithVerifyIcon extends StatelessWidget {
  const SgBrandTitleWithVerifyIcon(
      {super.key,
      this.textColor,
      this.maxLines = 1,
      required this.title,
      this.iconColor = SgColors.primary,
      this.textAlign = TextAlign.center,
      this.brandTextSize = TextSizes.small});

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: SgBrandTitleText(
            title: title,
            color: textColor,
            maxLines: maxLines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(
          width: SgSizes.xs,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: SgSizes.iconXs,
        )
      ],
    );
  }
}
