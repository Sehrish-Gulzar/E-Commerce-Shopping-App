import 'package:e_commerce_shopping_app/utils/theme/widget_themes/bottom_sheet_theme.dart';
import 'package:e_commerce_shopping_app/utils/theme/widget_themes/chip_theme.dart';
import 'package:e_commerce_shopping_app/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:e_commerce_shopping_app/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:e_commerce_shopping_app/utils/theme/widget_themes/text_field_theme.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/text_theme.dart';

class SgAppTheme {
  SgAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: SgColors.grey,
    brightness: Brightness.light,
    primaryColor: SgColors.primary,
    textTheme: SgTextTheme.lightTextTheme,
    chipTheme: SgChipTheme.lightChipTheme,
    scaffoldBackgroundColor: SgColors.white,
    appBarTheme: SgAppBarTheme.lightAppBarTheme,
    checkboxTheme: SgCheckboxTheme.lightCheckboxTheme,
    bottomSheetTheme: SgBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: SgElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: SgOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: SgTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    disabledColor: SgColors.grey,
    brightness: Brightness.dark,
    primaryColor: SgColors.primary,
    textTheme: SgTextTheme.darkTextTheme,
    chipTheme: SgChipTheme.darkChipTheme,
    scaffoldBackgroundColor: SgColors.black,
    appBarTheme: SgAppBarTheme.darkAppBarTheme,
    checkboxTheme: SgCheckboxTheme.darkCheckboxTheme,
    bottomSheetTheme: SgBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: SgElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: SgOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: SgTextFormFieldTheme.darkInputDecorationTheme,
  );
}
