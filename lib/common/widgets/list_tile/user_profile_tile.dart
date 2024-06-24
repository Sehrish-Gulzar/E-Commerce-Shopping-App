import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/personalization/controllers/user_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/circular_image.dart';
import '../shimmer/shimmer_effect.dart';

class SgUserProfileTile extends StatelessWidget {
  const SgUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(
        () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : SgImages.user;
          return controller.imageUploading.value
              ? const SgShimmerEffect(
                  width: 50,
                  height: 50,
                  radius: 50,
                )
              : SgCircularImage(
                  image: image,
                  height: 50,
                  width: 50,
                  padding: 0,
                  isNetworkImage: networkImage.isNotEmpty,
                );
        },
      ),
      title: Obx(() => Text(
            controller.user.value.fullName,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: SgColors.white),
          )),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: SgColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: SgColors.white,
        ),
      ),
    );
  }
}
