import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/image_text/vertical_image_text.dart';
import '../../../../../common/widgets/shimmer/category_shimmer.dart';
import '../../../controllers/category_controller.dart';
import '../../sub_category/sub_categories.dart';

class SgHomeCategories extends StatelessWidget {
  const SgHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) return const SgCategoryShimmer();

      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      } else {
        return SizedBox(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredCategories.length,
            itemBuilder: (context, index) {
              final category = controller.featuredCategories[index];
              return SgVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () =>
                    Get.to(() => SubCategoriesScreen(category: category)),
              );
            },
          ),
        );
      }
    });
  }
}
