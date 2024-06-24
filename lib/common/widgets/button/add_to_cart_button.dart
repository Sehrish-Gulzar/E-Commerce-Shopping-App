import 'package:e_commerce_shopping_app/features/shop/screens/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/shop/controllers/product/cart_controller.dart';
import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(CartController());
    return InkWell(
      onTap: () {
        // If the product have variations then show the product Details for variation  selection.
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
        // Else add product to the cart
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? SgColors.primary : SgColors.dark,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(SgSizes.cardRadiusMd),
                bottomRight: Radius.circular(SgSizes.productImageRadius)),
          ),
          child: SizedBox(
              width: SgSizes.iconLg * 1.2,
              height: SgSizes.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0
                      ? Text(
                          productQuantityInCart.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: SgColors.white),
                        )
                      : const Icon(
                          Iconsax.add,
                          color: SgColors.white,
                        ))),
        );
      }),
    );
  }
}
