import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/address_controller.dart';

class SgBillingAddressSection extends StatelessWidget {
  const SgBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SgSectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
          onPressed: () => controller.selectNewAddressPopup(context),
        ),
        controller.selectedAddress.value.id.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SgTexts.homeAppbarSubTitle,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(
                    height: SgSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        size: 16,
                        color: Colors.grey,
                      ),
                      const SizedBox(
                        width: SgSizes.spaceBtwItems,
                      ),
                      Text(
                        '+92 317 3766981',
                        style: Theme.of(context).textTheme.bodyMedium,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: SgSizes.spaceBtwItems / 2,
                  ),
                  Row(children: [
                    const Icon(
                      Icons.location_history,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: SgSizes.spaceBtwItems,
                    ),
                    Text(
                      'South Liana, Maine 87695, USA',
                      style: Theme.of(context).textTheme.bodyMedium,
                      softWrap: true,
                    )
                  ])
                ],
              )
            : Text(
                'Select Address',
                style: Theme.of(context).textTheme.bodyMedium,
              )
      ],
    );
  }
}
