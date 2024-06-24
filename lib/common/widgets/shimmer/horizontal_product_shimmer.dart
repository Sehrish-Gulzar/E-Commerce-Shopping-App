import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_effect.dart';

class SgHorizontalProductShimmer extends StatelessWidget {
  const SgHorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: SgSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: SgSizes.spaceBtwItems,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Image
            SgShimmerEffect(width: 120, height: 120),
            SizedBox(
              width: SgSizes.spaceBtwItems,
            ),

            /// Text
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SgSizes.spaceBtwItems,
                    ),
                    SgShimmerEffect(width: 160, height: 15),
                    SizedBox(
                      height: SgSizes.spaceBtwItems / 2,
                    ),
                    SgShimmerEffect(width: 110, height: 15),
                  ],
                ),
                Row(
                  children: [
                    SgShimmerEffect(width: 40, height: 20),
                    SizedBox(
                      width: SgSizes.spaceBtwSections,
                    ),
                    SgShimmerEffect(width: 40, height: 20),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
