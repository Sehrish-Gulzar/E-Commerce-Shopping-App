import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/product/cart_controller.dart';
import '../../../../features/shop/screens/cart/cart.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helper_functions.dart';

class SgCartCounterIcon extends StatelessWidget {
  final Color? iconColor;
  final Color? textColor;

  const SgCartCounterIcon({super.key, this.iconColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    final dark = SgHelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor ?? (dark ? SgColors.light : SgColors.dark),
        ),
        Positioned(
          right: 0,
          child: Container(
            height: 18,
            width: 18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dark ? SgColors.light : SgColors.dark,
            ),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfCartItem.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color:
                          textColor ?? (dark ? SgColors.dark : SgColors.light),
                      fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
