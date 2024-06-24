import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class SgChipTheme {
  SgChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: SgColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: SgColors.black),
    selectedColor: SgColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: SgColors.white,
  );

  static ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: SgColors.darkerGrey,
    labelStyle: TextStyle(color: SgColors.white),
    selectedColor: SgColors.primary,
    padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
    checkmarkColor: SgColors.white,
  );
}
