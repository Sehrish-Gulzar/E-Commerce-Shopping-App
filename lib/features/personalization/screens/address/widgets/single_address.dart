import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../../authentication/models/address_model.dart';
import '../../../controllers/address_controller.dart';

class SgSingleAddress extends StatelessWidget {
  const SgSingleAddress(
      {super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);

    final controller = AddressController.instance;

    return Obx(() {
      final selectedAddressId = controller.selectedAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        borderRadius: BorderRadius.circular(SgSizes.cardRadiusLg),
        onTap: onTap,
        child: SgRoundedContainer(
          padding: const EdgeInsets.all(SgSizes.md),
          width: double.infinity,
          showBorder: true,
          backgroundColor: selectedAddress
              ? SgColors.primary.withOpacity(0.5)
              : Colors.transparent,
          borderColor: selectedAddress
              ? Colors.transparent
              : dark
                  ? SgColors.darkerGrey
                  : SgColors.grey,
          margin: const EdgeInsets.only(bottom: SgSizes.spaceBtwItems),
          child: Stack(
            children: [
              Positioned(
                right: 5,
                top: 0,
                child: Icon(
                  selectedAddress ? Iconsax.tick_circle5 : null,
                  color: selectedAddress
                      ? dark
                          ? SgColors.light
                          : SgColors.dark
                      : null,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    address.name,
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: SgSizes.sm / 2,
                  ),
                  Text(
                    address.phoneNumber,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: SgSizes.sm / 2,
                  ),
                  Text(
                    address.toString(),
                    softWrap: true,
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
