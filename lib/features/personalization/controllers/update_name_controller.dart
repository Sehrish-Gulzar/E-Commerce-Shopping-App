import 'package:e_commerce_shopping_app/features/personalization/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../data/repositories/user/user_repository.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../screens/profile/profile.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// Init user data when when home screen appears
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  /// Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start Loading
      SgFullScreenLoader.openLoadingDialog(
          'We are updating your information...', SgImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        SgFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        SgFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text;
      userController.user.value.lastName = lastName.text;

      // Remove Loading
      SgFullScreenLoader.stopLoading();

      // Show Success Message
      SgHelperFunctions.successSnackBar(
          title: 'Congratulations', message: 'Your name has been updated');

      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // Stop Loading
      SgFullScreenLoader.stopLoading();
      // Show Error message
      SgHelperFunctions.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
