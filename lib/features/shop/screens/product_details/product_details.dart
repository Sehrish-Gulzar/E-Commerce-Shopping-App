import 'package:e_commerce_shopping_app/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/product_details/widgets/rating_and_share.dart';
import 'package:e_commerce_shopping_app/utils/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../models/product_model.dart';
import '../product_reviews/profuct_reviews.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: SgBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Product Image Slider
            SgProductImageSlider(
              product: product,
            ),

            /// Product Details
            Padding(
              padding: const EdgeInsets.only(
                  left: SgSizes.defaultSpace,
                  right: SgSizes.defaultSpace,
                  bottom: SgSizes.defaultSpace),
              child: Column(
                children: [
                  /// Rating & Share
                  const SgRatingAndShare(),

                  /// Price, Title, Stock And Brand
                  SgProductMetaData(
                    product: product,
                  ),

                  /// Attributes
                  if (product.productType ==
                      ProductType.variable.toString()) ...[
                    SgProductAttributes(
                      product: product,
                    ),
                    const SizedBox(
                      height: SgSizes.spaceBtwSections,
                    ),
                  ],

                  /// Checkout Button
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            // Get.to(() => const CheckoutScreen());
                          },
                          child: const Text('Checkout'))),
                  const SizedBox(
                    height: SgSizes.spaceBtwSections,
                  ),

                  /// Description
                  const SgSectionHeading(title: 'Description'),
                  const SizedBox(
                    height: SgSizes.spaceBtwItems,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ReadMoreText(
                      product.description ?? '',
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Less',
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                      lessStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    height: SgSizes.spaceBtwItems,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: SgSizes.spaceBtwItems,
                  ),

                  /// Reviews
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SgSectionHeading(title: 'Reviews(199)'),
                      IconButton(
                          onPressed: () =>
                              Get.to(() => const ProductReviewsScreen()),
                          icon: const Icon(
                            Iconsax.arrow_right_3,
                            size: 18,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
