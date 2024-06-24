import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/* -- Light & Dark Elevated Button Themes -- */
class SgElevatedButtonTheme {
  SgElevatedButtonTheme._(); //To avoid creating instances

  /* -- Light Theme -- */
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: SgColors.light,
      backgroundColor: SgColors.primary,
      disabledForegroundColor: SgColors.darkGrey,
      disabledBackgroundColor: SgColors.buttonDisabled,
      side: const BorderSide(color: SgColors.lightContainer),
      padding: const EdgeInsets.symmetric(vertical: SgSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: SgColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SgSizes.buttonRadius)),
    ),
  );

  /* -- Dark Theme -- */
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: SgColors.light,
      backgroundColor: SgColors.primary,
      disabledForegroundColor: SgColors.darkGrey,
      disabledBackgroundColor: SgColors.darkerGrey,
      side: const BorderSide(color: SgColors.primary),
      padding: const EdgeInsets.symmetric(vertical: SgSizes.buttonHeight),
      textStyle: const TextStyle(
          fontSize: 16, color: SgColors.textWhite, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SgSizes.buttonRadius)),
    ),
  );
}
