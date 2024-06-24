import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class SgTextFormFieldTheme {
  SgTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: SgColors.darkGrey,
    suffixIconColor: SgColors.darkGrey,
    labelStyle: const TextStyle()
        .copyWith(fontSize: SgSizes.fontSizeMd, color: SgColors.black),
    hintStyle: const TextStyle()
        .copyWith(fontSize: SgSizes.fontSizeSm, color: SgColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelStyle:
        const TextStyle().copyWith(color: SgColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: SgColors.warning),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 2,
    prefixIconColor: SgColors.darkGrey,
    suffixIconColor: SgColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle()
        .copyWith(fontSize: SgSizes.fontSizeMd, color: SgColors.white),
    hintStyle: const TextStyle()
        .copyWith(fontSize: SgSizes.fontSizeSm, color: SgColors.white),
    floatingLabelStyle:
        const TextStyle().copyWith(color: SgColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: SgColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(SgSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: SgColors.warning),
    ),
  );
}
