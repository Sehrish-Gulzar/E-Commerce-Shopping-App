import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup/signup_controller.dart';

class SgTermsAndConditionCheckbox extends StatelessWidget {
  const SgTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final dark = SgHelperFunctions.isDarkMode(context);

    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(
          width: SgSizes.spaceBtwItems,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: '${SgTexts.iAgreeTo} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: SgTexts.privacyPolicy,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: dark ? SgColors.white : SgColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? SgColors.white : SgColors.primary)),
                TextSpan(
                    text: ' ${SgTexts.and} ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: SgTexts.termsOfUse,
                    style: Theme.of(context).textTheme.bodyMedium!.apply(
                        color: dark ? SgColors.white : SgColors.primary,
                        decoration: TextDecoration.underline,
                        decorationColor:
                            dark ? SgColors.white : SgColors.primary))
              ],
            ),
          ),
        )
      ],
    );
  }
}
