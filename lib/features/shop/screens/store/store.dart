import 'package:e_commerce_shopping_app/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/appbar/tabbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/custom_shapes/containers/search_container.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../common/widgets/shimmer/brands_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import '../../controllers/category_controller.dart';
import '../../controllers/product/brand_controller.dart';
import '../brand/all_brands.dart';
import '../brand/brand_products.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    final categories = CategoryController.instance.featuredCategories;
    final brandController = Get.put(BrandController());

    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: SgAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: const [
            SgCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: true,
                    pinned: true,
                    backgroundColor: dark ? SgColors.black : SgColors.white,
                    expandedHeight: 440,
                    flexibleSpace: Padding(
                        padding: const EdgeInsets.all(SgSizes.defaultSpace),
                        child: ListView(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            /// Search Appbar
                            const SizedBox(
                              height: SgSizes.spaceBtwItems,
                            ),
                            const SgSearchContainer(
                              text: 'Search in Store',
                              showBorder: true,
                              showBackground: false,
                              padding: EdgeInsets.zero,
                            ),
                            const SizedBox(
                              height: SgSizes.spaceBtwSections,
                            ),

                            /// Featured Brands
                            SgSectionHeading(
                              title: 'Featured Brands',
                              showActionButton: true,
                              onPressed: () =>
                                  Get.to(() => const AllBrandsScreen()),
                            ),
                            const SizedBox(
                              height: SgSizes.spaceBtwItems / 1.5,
                            ),

                            /// Brand GridView
                            Obx(() {
                              if (brandController.isLoading.value) {
                                return const SgBrandsShimmer();
                              }

                              if (brandController.featuredBrands.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No Data Found!',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(color: Colors.white),
                                  ),
                                );
                              }

                              return SgGridLayout(
                                itemCount:
                                    brandController.featuredBrands.length,
                                mainAxisExtent: 80,
                                itemBuilder: (context, index) {
                                  final brand =
                                      brandController.featuredBrands[index];
                                  return SgBrandCard(
                                    showBorder: true,
                                    brand: brand,
                                    onTap: () => Get.to(
                                        () => BrandProducts(brand: brand)),
                                  );
                                },
                              );
                            }),
                          ],
                        )),
                    bottom: SgTabBar(
                        tabs: categories
                            .map((category) => Tab(
                                  child: Text(category.name),
                                ))
                            .toList())),
              ];
            },
            body: TabBarView(
              children: categories
                  .map(
                    (category) => SgCategoryTab(category: category),
                  )
                  .toList(),
            )),
      ),
    );
  }
}
