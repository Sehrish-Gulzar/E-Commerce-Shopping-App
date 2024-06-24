import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/brands/brand_card.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/shimmer/brands_shimmer.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/product/brand_controller.dart';
import 'brand_products.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const SgAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              const SgSectionHeading(title: 'Brands'),
              const SizedBox(
                height: SgSizes.spaceBtwItems,
              ),

              /// Brands
              Obx(() {
                if (brandController.isLoading.value) {
                  return const SgBrandsShimmer();
                }

                if (brandController.allBrands.isEmpty) {
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
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (context, index) {
                    final brand = brandController.allBrands[index];
                    return SgBrandCard(
                      showBorder: false,
                      brand: brand,
                      onTap: () => Get.to(() => BrandProducts(
                            brand: brand,
                          )),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
