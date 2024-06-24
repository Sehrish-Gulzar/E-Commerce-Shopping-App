import 'package:e_commerce_shopping_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/login_signup/form_divider.dart';
import '../../../../common/widgets/login_signup/social_buttons.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                SgTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),

              /// Form
              const SgSignUpForm(),

              /// Divider
              SgFormDivider(dividerText: SgTexts.orSignUpWith.capitalize!),
              const SizedBox(
                height: SgSizes.spaceBtwSections,
              ),

              /// Social Buttons
              const SgSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
