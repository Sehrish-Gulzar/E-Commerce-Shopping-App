import 'package:flutter/material.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/circular_image.dart';
import '../../../../../common/widgets/products/product_price_text.dart';
import '../../../../../common/widgets/texts/brand_title_text_with_verify_icon.dart';
import '../../../../../common/widgets/texts/product_title.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/enums.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/product_controller.dart';
import '../../../models/product_model.dart';

class SgProductMetaData extends StatelessWidget {
  const SgProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = SgHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            if (salePercentage != null)
              SgRoundedContainer(
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
                  )),
            const SizedBox(
              width: SgSizes.spaceBtwItems,
            ),

            /// Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: SgSizes.spaceBtwItems,
              ),
            SgProductPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            )
          ],
        ),
        const SizedBox(
          height: SgSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        SgProductTitleText(title: product.title),
        const SizedBox(
          height: SgSizes.spaceBtwItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            const SgProductTitleText(title: 'Status'),
            const SizedBox(width: SgSizes.spaceBtwItems),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(height: SgSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            SgCircularImage(
              image: (product.brand != null) ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: dark ? SgColors.white : SgColors.black,
            ),
            SgBrandTitleWithVerifyIcon(
              title: (product.brand != null) ? product.brand!.name : '',
              brandTextSize: TextSizes.medium,
            ),
          ],
        )
      ],
    );
  }
}
