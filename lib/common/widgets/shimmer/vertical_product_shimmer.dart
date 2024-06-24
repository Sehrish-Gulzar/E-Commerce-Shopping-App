import 'package:e_commerce_shopping_app/common/widgets/shimmer/shimmer_effect.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import '../layouts/grid_layout.dart';

class SgVerticalProductShimmer extends StatelessWidget {
  const SgVerticalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SgGridLayout(
      itemCount: itemCount,
      itemBuilder: (context, index) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            SgShimmerEffect(width: 180, height: 180),
            SizedBox(
              height: SgSizes.spaceBtwItems,
            ),

            /// Text
            SgShimmerEffect(width: 160, height: 15),
            SizedBox(
              height: SgSizes.spaceBtwItems / 2,
            ),
            SgShimmerEffect(width: 110, height: 15)
          ],
        ),
      ),
    );
  }
}
