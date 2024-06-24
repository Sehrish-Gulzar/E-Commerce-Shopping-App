import 'package:e_commerce_shopping_app/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:e_commerce_shopping_app/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:e_commerce_shopping_app/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:e_commerce_shopping_app/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/text_strings.dart';
import '../../controllers/onboarding/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
        body: Stack(children: [
      /// Horizontal Scrollable Pages
      PageView(
        controller: controller.pageController,
        onPageChanged: controller.updatePageIndicator,
        children: const [
          OnBoardingPage(
            image: SgImages.onBoardingImage1,
            title: SgTexts.onBoardingTitle1,
            subtitle: SgTexts.onBoardingSubTitle1,
          ),
          OnBoardingPage(
            image: SgImages.onBoardingImage2,
            title: SgTexts.onBoardingTitle2,
            subtitle: SgTexts.onBoardingSubTitle2,
          ),
          OnBoardingPage(
            image: SgImages.onBoardingImage3,
            title: SgTexts.onBoardingTitle3,
            subtitle: SgTexts.onBoardingSubTitle3,
          ),
        ],
      ),

      /// Skip Button
      const OnBoardingSkip(),

      /// Dot Navigation SmoothPageIndicator
      const OnBoardingDotNavigation(),

      /// Circular Button
      const OnBoardingNextButton()
    ]));
  }
}
