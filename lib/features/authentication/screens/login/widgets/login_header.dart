import 'package:flutter/material.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class SgLoginHeader extends StatelessWidget {
  const SgLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 100,
          image:
              AssetImage(dark ? SgImages.lightAppLogo : SgImages.darkAppLogo),
        ),
        const SizedBox(
          height: SgSizes.spaceBtwItems,
        ),
        Text(
          SgTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: SgSizes.sm),
        Text(
          SgTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
