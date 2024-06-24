import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';
import 'shimmer_effect.dart';

class SgBoxesShimmer extends StatelessWidget {
  const SgBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            /// Three Products
            Expanded(child: SgShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: SgSizes.spaceBtwItems,
            ),
            Expanded(child: SgShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: SgSizes.spaceBtwItems,
            ),
            Expanded(child: SgShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
