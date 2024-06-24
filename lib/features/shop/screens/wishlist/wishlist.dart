import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/icons/circular_icon.dart';
import '../../../../common/widgets/layouts/grid_layout.dart';
import '../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../common/widgets/products/product_cards/product_card_vertical.dart';
import '../../../../common/widgets/shimmer/vertical_product_shimmer.dart';
import '../../../../navigation_menu.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../controllers/product/favourite_controller.dart';
import '../home/home.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Scaffold(
      appBar: SgAppBar(
        title:
            Text('WishList', style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          SgCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(() => const HomeScreen()),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(SgSizes.defaultSpace),

          /// Product Grid
          child: Obx(
            () => FutureBuilder(
                future: controller.favouriteProducts(),
                builder: (context, snapshot) {
                  /// Nothing found widget
                  final emptyWidget = SgAnimationLoader(
                    text: 'Whoops! Wishlist is Empty...',
                    animation: SgImages.emptyAnimation,
                    showAction: true,
                    actionText: "Let's add some",
                    onActionPressed: () =>
                        Get.off(() => const NavigationMenu()),
                  );

                  /// Loading Widget
                  const loader = SgVerticalProductShimmer(
                    itemCount: 6,
                  );

                  final widget = SgCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return SgGridLayout(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return SgProductCardVertical(
                        product: products[index],
                      );
                    },
                  );
                }),
          ),
        ),
      ),
    );
  }
}
