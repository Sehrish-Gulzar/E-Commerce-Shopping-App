import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/checkout_controller.dart';

class SgBillingPaymentSection extends StatelessWidget {
  const SgBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CheckoutController());
    final dark = SgHelperFunctions.isDarkMode(context);

    return Column(
      children: [
        SgSectionHeading(
          title: 'Payment Method',
          showActionButton: true,
          onPressed: () => controller.selectPaymentMethod(context),
          buttonTitle: 'Change',
        ),
        const SizedBox(
          height: SgSizes.spaceBtwItems / 2,
        ),
        Obx(
          () => Row(
            children: [
              SgRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? SgColors.light : SgColors.white,
                padding: const EdgeInsets.all(SgSizes.sm),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: SgSizes.spaceBtwItems / 2,
              ),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        )
      ],
    );
  }
}
