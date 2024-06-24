import 'package:e_commerce_shopping_app/common/widgets/texts/section_heading.dart';
import 'package:e_commerce_shopping_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:e_commerce_shopping_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/images/circular_image.dart';
import '../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/user_controller.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const SgAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),
          child: Column(
            children: [
              /// Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : SgImages.user;
                      return controller.imageUploading.value
                          ? const SgShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : SgCircularImage(
                              image: image,
                              height: 80,
                              width: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: SgSizes.spaceBtwItems / 2,
              ),

              /// Details
              const Divider(),
              const SizedBox(
                height: SgSizes.spaceBtwItems,
              ),

              /// Profile Information
              const SgSectionHeading(title: 'Profile Information'),
              const SizedBox(
                height: SgSizes.spaceBtwItems,
              ),

              SgProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              SgProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              /// Personal Information
              const SgSectionHeading(title: 'Personal Information'),
              const SizedBox(
                height: SgSizes.spaceBtwItems,
              ),

              SgProfileMenu(
                title: 'User ID',
                value: controller.user.value.id,
                onPressed: () {},
                icon: Iconsax.copy,
              ),
              SgProfileMenu(
                title: 'E-mail',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              SgProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              SgProfileMenu(
                title: 'Gender',
                value: 'Female',
                onPressed: () {},
              ),
              SgProfileMenu(
                title: 'Date of Birth',
                value: '11-November, 2000',
                onPressed: () {},
              ),
              const Divider(),
              const SizedBox(
                height: SgSizes.spaceBtwItems,
              ),

              /// Close Account Button
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
