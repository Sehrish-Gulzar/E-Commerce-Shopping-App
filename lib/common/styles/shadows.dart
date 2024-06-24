import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SgShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: SgColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));

  static final horizontalProductShadow = BoxShadow(
      color: SgColors.darkGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
