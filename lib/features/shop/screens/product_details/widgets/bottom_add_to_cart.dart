import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/cart_controller.dart';
import '../../../models/product_model.dart';

class SgBottomAddToCart extends StatelessWidget {
  const SgBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    final controller = CartController.instance;

    controller.updateAlreadyAddedProductCount(product);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: SgSizes.defaultSpace, vertical: SgSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? SgColors.darkerGrey : SgColors.light,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(SgSizes.cardRadiusLg),
            topRight: Radius.circular(SgSizes.cardRadiusLg)),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SgCircularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: SgColors.darkGrey,
                  height: 40,
                  width: 40,
                  color: SgColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(
                  width: SgSizes.spaceBtwItems,
                ),
                Text(
                  controller.productQuantityInCart.value.toString(),
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                const SizedBox(
                  width: SgSizes.spaceBtwItems,
                ),
                SgCircularIcon(
                  icon: Iconsax.add,
                  width: 40,
                  height: 40,
                  backgroundColor: SgColors.black,
                  color: SgColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                )
              ],
            ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart < 1
                    ? null
                    : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(SgSizes.md),
                    backgroundColor: SgColors.black,
                    side: const BorderSide(color: SgColors.black)),
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
