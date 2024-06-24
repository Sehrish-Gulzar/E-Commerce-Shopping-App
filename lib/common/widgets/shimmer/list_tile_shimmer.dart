import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_effect.dart';

class SgListTileShimmer extends StatelessWidget {
  const SgListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Brand Logo
            SgShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: SgSizes.spaceBtwItems,
            ),
            Column(
              children: [
                /// Brand Name
                SgShimmerEffect(width: 100, height: 15),
                SizedBox(
                  height: SgSizes.spaceBtwItems / 2,
                ),

                /// Brand products
                SgShimmerEffect(width: 80, height: 12)
              ],
            )
          ],
        )
      ],
    );
  }
}
