import 'package:e_commerce_shopping_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class SgCategoryShimmer extends StatelessWidget {
  const SgCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: SgSizes.spaceBtwItems,
        ),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              SgShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),

              /// Text
              SgShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
