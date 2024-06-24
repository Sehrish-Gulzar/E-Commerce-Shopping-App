import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../screens/login/login.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  /// Variables
  PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  /// Update current index when page scroll
  void updatePageIndicator(index) => currentIndex.value = index;

  /// Jump to specific dot  selected page
  void dotNavigationClick(index) {
    currentIndex.value = index;
    pageController.jumpToPage(index);
  }

  /// Update current index and jump to the next page
  void nextPage() {
    if (currentIndex.value == 2) {
      GetStorage storage = GetStorage();
      storage.write('IsFirstTime', false);
      Get.offAll(const LoginScreen());
    } else {
      currentIndex.value = currentIndex.value + 1;
      pageController.jumpToPage(currentIndex.value);
    }
  }

  /// Update current index and jump to the last page
  void skipPage() {
    currentIndex.value = 2;
    pageController.jumpToPage(currentIndex.value);
  }
}
