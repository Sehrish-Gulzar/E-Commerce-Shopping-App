import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/custom_shapes/containers/circular_container.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/shimmer/shimmer_effect.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/banner_controller.dart';

class SgPromoSlider extends StatelessWidget {
  const SgPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const SgShimmerEffect(width: double.infinity, height: 190);
      }

      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found!'),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.banners
                  .map((banner) => SgRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    controller.updatePageIndicator(index),
              ),
            ),
            const SizedBox(
              height: SgSizes.spaceBtwItems,
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < controller.banners.length; i++)
                    SgCircularContainer(
                      width: 20,
                      height: 4,
                      margin: const EdgeInsets.only(right: 10),
                      backgroundColor:
                          (controller.carouselCurrentIndex.value == i)
                              ? SgColors.primary
                              : SgColors.grey,
                    ),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
