import 'package:flutter/material.dart';

import '../../../../features/shop/controllers/product/product_controller.dart';
import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../button/add_to_cart_button.dart';
import '../../custom_shapes/containers/rounded_container.dart';
import '../../images/rounded_image.dart';
import '../../texts/brand_title_text_with_verify_icon.dart';
import '../../texts/product_title.dart';
import '../favourite_icon/favourite_icon.dart';
import '../product_price_text.dart';

class SgProductCardHorizontal extends StatelessWidget {
  const SgProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = SgHelperFunctions.isDarkMode(context);

    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(SgSizes.productImageRadius),
          color: dark ? SgColors.darkerGrey : SgColors.lightContainer),
      child: Row(
        children: [
          /// Thumbnail Discount Tag & Fav Icon
          SgRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(SgSizes.sm),
            backgroundColor: dark ? SgColors.dark : SgColors.light,
            child: Stack(
              children: [
                /// Thumbnail Image
                SizedBox(
                  width: 120,
                  height: 120,
                  child: SgRoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),

                /// Sale Tag
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: SgRoundedContainer(
                      radius: SgSizes.sm,
                      backgroundColor: SgColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: SgSizes.sm, vertical: SgSizes.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: SgColors.black),
                      ),
                    ),
                  ),

                /// Favourite Icon Button
                Positioned(
                    right: 0,
                    top: 0,
                    child: SgFavouriteIcon(productId: product.id))
              ],
            ),
          ),

          ///  Details, Add to cart & Pricing
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: SgSizes.sm, left: SgSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SgProductTitleText(title: product.title, smallSize: true),
                  const SizedBox(
                    height: SgSizes.spaceBtwItems / 2,
                  ),
                  SgBrandTitleWithVerifyIcon(title: product.brand!.name),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Price
                      Flexible(
                        child: Column(
                          children: [
                            /// if There is Sale then show sale actual price with line-through
                            if (product.productType ==
                                    ProductType.single.toString() &&
                                product.salePrice > 0.0)
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: SgSizes.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              ),

                            /// Price, show sale price as main price if sale exist
                            Padding(
                              padding: const EdgeInsets.only(left: SgSizes.sm),
                              child: SgProductPriceText(
                                  price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      /// Add to Cart
                      ProductCardAddToCartButton(product: product)
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
