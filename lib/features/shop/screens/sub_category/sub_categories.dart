import 'package:e_commerce_shopping_app/features/shop/controllers/category_controller.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_products.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../models/category_model.dart';
import '../home/widgets/promo_slider.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: SgAppBar(
        showBackArrow: true,
        title: Text(
          category.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const SgPromoSlider(),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    // Handle Loader, No Record OR Error Message
                    const loader = SgVerticalProductShimmer();
                    final widget = SgCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return SgSortableProducts(products: products);
                  })

              /// Sub Categories
              // FutureBuilder(
              //     future: controller.getSubCategories(category.id),
              //     builder: (context, snapshot) {
              //       /// Handle Loader, No Message, Error
              //       const loader = SgHorizontalProductShimmer();
              //       final widget = SgCloudHelperFunctions.checkMultiRecordState(
              //           snapshot: snapshot, loader: loader);
              //       if (widget != null) return widget;
              //
              //       /// Record Found
              //       final subCategories = snapshot.data!;
              //
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: subCategories.length,
              //         physics: const NeverScrollableScrollPhysics(),
              //         itemBuilder: (context, index) {
              //           final subCategory = subCategories[index];
              //
              //           return FutureBuilder(
              //               future: controller.getCategoryProducts(
              //                   categoryId: subCategory.id),
              //               builder: (context, snapshot) {
              //                 /// Handle Loader, No Message, Error
              //                 final widget =
              //                     SgCloudHelperFunctions.checkMultiRecordState(
              //                         snapshot: snapshot, loader: loader);
              //                 if (widget != null) return widget;
              //
              //                 /// Record Found
              //                 final products = snapshot.data!;
              //
              //                 return Column(
              //                   children: [
              //                     /// Heading
              //                     SgSectionHeading(
              //                       title: subCategory.name,
              //                       showActionButton: true,
              //                       onPressed: () => Get.to(() => AllProducts(
              //                             title: subCategory.name,
              //                             futureMethod:
              //                                 controller.getCategoryProducts(
              //                                     categoryId: subCategory.id,
              //                                     limit: -1),
              //                           )),
              //                     ),
              //                     const SizedBox(
              //                       height: SgSizes.spaceBtwItems / 2,
              //                     ),
              //
              //                     SizedBox(
              //                       height: 120,
              //                       child: ListView.separated(
              //                           separatorBuilder: (context, index) =>
              //                               const SizedBox(
              //                                 width: SgSizes.spaceBtwItems,
              //                               ),
              //                           itemCount: products.length,
              //                           scrollDirection: Axis.horizontal,
              //                           itemBuilder: (context, index) =>
              //                               SgProductCardHorizontal(
              //                                   product: products[index])),
              //                     ),
              //
              //                     const SizedBox(
              //                       height: SgSizes.spaceBtwSections,
              //                     )
              //                   ],
              //                 );
              //               });
              //         },
              //       );
              //     })
            ],
          ),
        ),
      ),
    );
  }
}
