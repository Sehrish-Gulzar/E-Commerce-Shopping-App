import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../icons/circular_icon.dart';

class SgProductQuantityWithAddRemoveButton extends StatelessWidget {
  const SgProductQuantityWithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SgCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: SgSizes.md,
          color: dark ? SgColors.white : SgColors.black,
          backgroundColor: dark ? SgColors.darkerGrey : SgColors.light,
          onPressed: remove,
        ),
        const SizedBox(
          width: SgSizes.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: SgSizes.spaceBtwItems,
        ),
        SgCircularIcon(
          icon: Iconsax.add,
          height: 32,
          width: 32,
          size: SgSizes.md,
          color: SgColors.white,
          backgroundColor: SgColors.primary,
          onPressed: add,
        ),
      ],
    );
  }
}
