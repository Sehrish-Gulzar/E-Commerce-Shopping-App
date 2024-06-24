import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/loaders/animation_loader.dart';
import '../../../../../navigation_menu.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/order_controller.dart';

class SgOrdersListItems extends StatelessWidget {
  const SgOrdersListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);
    final controller = Get.put(OrderController());

    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (context, snapshot) {
          /// Nothing Found Widget
          final emptyWidget = SgAnimationLoader(
            text: 'Whoops! No Orders Yet!',
            animation: SgImages.orderCompletedAnimation,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          /// Handle Loader, No record or Error Message
          final widget = SgCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (widget != null) return widget;

          /// Record Found
          final orders = snapshot.data!;
          return ListView.separated(
            shrinkWrap: true,
            separatorBuilder: (context, index) => const SizedBox(
              height: SgSizes.spaceBtwItems,
            ),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return SgRoundedContainer(
                padding: const EdgeInsets.all(SgSizes.md),
                showBorder: true,
                backgroundColor: dark ? SgColors.dark : SgColors.light,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    /// Row-1
                    Row(
                      children: [
                        /// 1 - Icon
                        const Icon(Iconsax.ship),
                        const SizedBox(
                          width: SgSizes.spaceBtwItems / 2,
                        ),

                        /// 2 - Status & Date
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: SgColors.primary,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                                order.formattedOrderDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),

                        /// 3 - Icon
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.arrow_right_34,
                              size: SgSizes.iconSm,
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: SgSizes.spaceBtwItems,
                    ),

                    /// Row-2
                    Row(
                      children: [
                        /// Order
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.tag),
                              const SizedBox(
                                width: SgSizes.spaceBtwItems / 2,
                              ),

                              /// 2 - Status & Date
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Order',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.id,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        /// Shipping Date
                        Expanded(
                          child: Row(
                            children: [
                              /// 1 - Icon
                              const Icon(Iconsax.calendar),
                              const SizedBox(
                                width: SgSizes.spaceBtwItems / 2,
                              ),

                              /// 2 - Status & Date
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      'Shipping Date',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium,
                                    ),
                                    Text(
                                      order.formattedDeliveryDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          );
        });
  }
}
