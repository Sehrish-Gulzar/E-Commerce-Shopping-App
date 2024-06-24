import 'package:e_commerce_shopping_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:e_commerce_shopping_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/styles/spacing_styles.dart';
import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SgSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Logo , Title And Subtitle
              const SgLoginHeader(),

              /// Form
              const SgLoginForm(),

              /// Divider
              SgFormDivider(dividerText: SgTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),

              /// Footer
              const SgSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
