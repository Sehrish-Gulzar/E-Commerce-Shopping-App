import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/circular_image.dart';

class SgVerticalImageText extends StatelessWidget {
  const SgVerticalImageText(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = SgColors.white,
      this.backgroundColor,
      this.onTap,
      this.isNetworkImage = true});

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: SgSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            SgCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: SgSizes.sm * 1.2,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? SgColors.light : SgColors.dark,
            ),
            const SizedBox(
              height: SgSizes.spaceBtwItems / 2,
            ),

            /// Text
            Expanded(
              child: SizedBox(
                width: 60,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
