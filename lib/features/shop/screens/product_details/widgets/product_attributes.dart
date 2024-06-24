import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/products/product_price_text.dart';
import '../../../../../common/widgets/texts/product_title.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/variation_controller.dart';
import '../../../models/product_model.dart';

class SgProductAttributes extends StatelessWidget {
  const SgProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// Selected Attribute Pricing & Description
          // Display variation price and stock when some variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            SgRoundedContainer(
              backgroundColor: dark ? SgColors.darkerGrey : SgColors.grey,
              padding: const EdgeInsets.all(SgSizes.md),

              /// Title, Price and Stock Status
              child: Column(
                children: [
                  Row(
                    children: [
                      const SgSectionHeading(title: 'Variation'),
                      const SizedBox(
                        width: SgSizes.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// Price Row
                          Row(
                            children: [
                              const SgProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),

                              /// Actual Price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price.toStringAsFixed(0)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          overflow: TextOverflow.ellipsis,
                                          decoration:
                                              TextDecoration.lineThrough),
                                ),
                              const SizedBox(
                                width: SgSizes.spaceBtwItems,
                              ),

                              /// Sale Price
                              SgProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),

                          /// Stock Row
                          Row(
                            children: [
                              const SgProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),

                  /// Variation Description
                  SgProductTitleText(
                    title: controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: SgSizes.spaceBtwItems,
          ),

          /// Attributes
          /// Multiple Colors Attributes & Multiple Sizes Attributes
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: product.productAttributes!.map((attribute) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SgSectionHeading(title: attribute.name ?? ''),
                    const SizedBox(
                      height: SgSizes.spaceBtwItems / 2,
                    ),
                    Obx(
                      () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValue) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValue; // 'Green' == 'Green'
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValue);
                            return SgChoiceChip(
                              text: attributeValue,
                              selected: isSelected,
                              onSelected: available
                                  ? (selected) {
                                      if (available && selected) {
                                        controller.onAttributeSelected(
                                            product,
                                            attribute.name ?? '',
                                            attributeValue);
                                      }
                                    }
                                  : null,
                            );
                          }).toList()),
                    )
                  ],
                );
              }).toList())
        ],
      ),
    );
  }
}
