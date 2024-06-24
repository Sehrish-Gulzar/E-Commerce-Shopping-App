import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../../common/widgets/texts/section_heading.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../controllers/category_controller.dart';
import '../../../models/category_model.dart';
import '../../all_products/all_products.dart';
import 'category_brands.dart';

class SgCategoryTab extends StatelessWidget {
  const SgCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Column(
            children: [
              /// Brands
              CategoryBrands(category: category),
              const SizedBox(
                height: SgSizes.spaceBtwItems,
              ),

              /// Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    /// Handle Error, Loader, Empty Data
                    const loader = SgVerticalProductShimmer();
                    final widget = SgCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Data Found!
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        SgSectionHeading(
                          title: 'You might like',
                          showActionButton: true,
                          onPressed: () => Get.to(() => AllProducts(
                                title: category.name,
                                futureMethod: controller.getCategoryProducts(
                                    categoryId: category.id, limit: -1),
                              )),
                        ),
                        const SizedBox(
                          height: SgSizes.spaceBtwItems,
                        ),
                        SgGridLayout(
                          itemCount: products.length,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return SgProductCardVertical(product: product);
                          },
                        ),
                        const SizedBox(
                          height: SgSizes.spaceBtwSections,
                        ),
                      ],
                    );
                  }),
            ],
          ),
        )
      ],
    );
  }
}
