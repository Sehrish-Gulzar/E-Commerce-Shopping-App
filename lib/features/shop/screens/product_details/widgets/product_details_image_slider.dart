import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import '../../../../../common/widgets/images/rounded_image.dart';
import '../../../../../common/widgets/products/favourite_icon/favourite_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/product/images_controller.dart';
import '../../../models/product_model.dart';

class SgProductImageSlider extends StatelessWidget {
  const SgProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    final dark = SgHelperFunctions.isDarkMode(context);
    return SgCurvedEdgesWidget(
      child: Container(
        color: dark ? SgColors.darkerGrey : SgColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                  padding: const EdgeInsets.all(SgSizes.productImageRadius * 2),
                  child: Center(
                    child: Obx(() {
                      final image = controller.selectedProductImage.value;
                      return GestureDetector(
                        onTap: () => controller.showEnlargeImage(image),
                        child: CachedNetworkImage(
                          imageUrl: image,
                          progressIndicatorBuilder: (context, url, progress) =>
                              CircularProgressIndicator(
                            color: SgColors.primary,
                            value: progress.progress,
                          ),
                        ),
                      );
                    }),
                  )),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              left: SgSizes.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: SgSizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return SgRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        onPressed: () => controller.selectedProductImage.value =
                            images[index],
                        backgroundColor: dark ? SgColors.dark : SgColors.white,
                        border: Border.all(
                            color: imageSelected
                                ? SgColors.primary
                                : Colors.transparent),
                        padding: const EdgeInsets.all(SgSizes.sm),
                        imageUrl: images[index]);
                  }),
                ),
              ),
            ),

            /// AppBar Icons
            SgAppBar(
              showBackArrow: true,
              actions: [
                SgFavouriteIcon(
                  productId: product.id,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
