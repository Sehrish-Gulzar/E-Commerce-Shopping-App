import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SgSearchContainer extends StatelessWidget {
  const SgSearchContainer(
      {super.key,
      required this.text,
      this.icon = Iconsax.search_normal,
      this.showBackground = true,
      this.showBorder = false,
      this.onTap,
      this.padding =
          const EdgeInsets.symmetric(horizontal: SgSizes.defaultSpace)});

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
          width: SgHelperFunctions.screenWidth(),
          padding: const EdgeInsets.all(SgSizes.md),
          decoration: BoxDecoration(
              color: showBackground
                  ? dark
                      ? SgColors.dark
                      : SgColors.light
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(SgSizes.borderRadiusLg),
              border: showBorder ? Border.all(color: SgColors.grey) : null),
          child: Row(
            children: [
              Icon(
                icon,
                color: SgColors.darkerGrey,
              ),
              const SizedBox(
                width: SgSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
