import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class SgCouponCode extends StatelessWidget {
  const SgCouponCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);

    return SgRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? SgColors.dark : SgColors.light,
      padding: const EdgeInsets.only(
          left: SgSizes.md,
          top: SgSizes.sm,
          right: SgSizes.sm,
          bottom: SgSizes.sm),
      child: Row(
        children: [
          /// TextField
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: 'Have a promo code? Enter Here',
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  border: InputBorder.none),
            ),
          ),

          /// Apply Button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  foregroundColor: dark
                      ? SgColors.white.withOpacity(0.5)
                      : SgColors.dark.withOpacity(0.5),
                  backgroundColor: SgColors.grey.withOpacity(0.2),
                  side: BorderSide(color: SgColors.grey.withOpacity(0.1))),
              onPressed: () {},
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
