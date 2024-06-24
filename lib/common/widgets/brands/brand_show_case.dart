import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../features/shop/screens/brand/brand_products.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../custom_shapes/containers/rounded_container.dart';
import '../shimmer/shimmer_effect.dart';
import 'brand_card.dart';

class SgBrandShowcase extends StatelessWidget {
  const SgBrandShowcase({super.key, required this.images, required this.brand});

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: SgRoundedContainer(
        showBorder: true,
        borderColor: SgColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: SgSizes.spaceBtwItems),
        padding: const EdgeInsets.all(SgSizes.md),
        child: Column(
          children: [
            /// Brand with product count
            SgBrandCard(brand: brand, showBorder: false),
            const SizedBox(
              height: SgSizes.spaceBtwItems,
            ),

            /// Brand Top 3 Products images
            Row(
                children: images
                    .map((image) => brandTopProductImageWidget(dark, image))
                    .toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(dark, String image) {
    return Expanded(
      child: SgRoundedContainer(
        height: 100,
        backgroundColor: dark ? SgColors.darkerGrey : SgColors.light,
        margin: const EdgeInsets.only(right: SgSizes.sm),
        padding: const EdgeInsets.all(SgSizes.md),
        child: CachedNetworkImage(
          fit: BoxFit.contain,
          imageUrl: image,
          progressIndicatorBuilder: (context, url, progress) =>
              const SgShimmerEffect(width: 100, height: 100),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
