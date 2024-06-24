import 'package:flutter/material.dart';

import '../layouts/grid_layout.dart';
import 'shimmer_effect.dart';

class SgBrandsShimmer extends StatelessWidget {
  const SgBrandsShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SgGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
      itemBuilder: (context, index) =>
          const SgShimmerEffect(width: 300, height: 80),
    );
  }
}
