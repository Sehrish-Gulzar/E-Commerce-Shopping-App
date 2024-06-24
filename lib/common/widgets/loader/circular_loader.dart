import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class SgCircularLoader extends StatelessWidget {
  const SgCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(SgSizes.lg),
        decoration: const BoxDecoration(
            color: SgColors.primary, shape: BoxShape.circle),
        child: const CircularProgressIndicator(
          color: SgColors.white,
        ));
  }
}
