import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/home/widgets/home_categories.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/product_controller.dart';
import '../all_products/all_products.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SgPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  SgHomeAppBar(),
                  SizedBox(
                    height: SgSizes.spaceBtwSections,
                  ),

                  /// SearchBar
                  SgSearchContainer(
                    text: 'Search in Store',
                  ),
                  SizedBox(
                    height: SgSizes.spaceBtwSections,
                  ),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: SgSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// Heading
                        SgSectionHeading(
                          title: 'Popular Categories',
                          textColor: SgColors.white,
                        ),
                        SizedBox(
                          height: SgSizes.spaceBtwItems,
                        ),

                        /// Categories
                        SgHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: SgSizes.spaceBtwItems * 2),
                ],
              ),
            ),

            /// Body
            Padding(
                padding: const EdgeInsets.all(SgSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Promo Slider
                    const SgPromoSlider(),
                    const SizedBox(
                      height: SgSizes.spaceBtwSections,
                    ),

                    /// Heading
                    SgSectionHeading(
                      title: 'Popular Products',
                      showActionButton: true,
                      onPressed: () => Get.to(() => AllProducts(
                            title: 'Popular Products',
                            query: FirebaseFirestore.instance
                                .collection("Products")
                                .where("IsFeatured", isEqualTo: true)
                                .limit(6),
                            futureMethod: controller.fetchAllFeaturedProducts(),
                          )),
                    ),
                    const SizedBox(
                      height: SgSizes.spaceBtwItems,
                    ),

                    /// Popular Products
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return const SgVerticalProductShimmer();
                        }

                        if (controller.featuredProducts.isEmpty) {
                          return Center(
                            child: Text(
                              'No Data Found!',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        } else {
                          return SgGridLayout(
                            itemCount: controller.featuredProducts.length,
                            itemBuilder: (context, index) =>
                                SgProductCardVertical(
                              product: controller.featuredProducts[index],
                            ),
                          );
                        }
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
