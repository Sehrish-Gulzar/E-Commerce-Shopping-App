import 'package:e_commerce_shopping_app/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';

class SgHomeAppBar extends StatelessWidget {
  const SgHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    final varcontroller = Get.put(VariationController());
    return SgAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            SgTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: SgColors.grey),
          ),
          Obx(
            () {
              if (controller.profileLoading.value) {
                // Display a shimmer loader while user profile is being loaded
                return const SgShimmerEffect(width: 80, height: 15);
              } else {
                return Text(controller.user.value.fullName,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .apply(color: SgColors.white));
              }
            },
          ),
        ],
      ),
      actions: const [
        SgCartCounterIcon(
          iconColor: SgColors.white,
        )
      ],
    );
  }
}
