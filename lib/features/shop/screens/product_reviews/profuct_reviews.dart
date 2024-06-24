import 'package:e_commerce_shopping_app/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:e_commerce_shopping_app/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/ratings/product_rating_indicator.dart';
import '../../../../utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SgAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(SgSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                    "Rating and reviews are verified and are from people who use the same type of device that you use."),
                const SizedBox(
                  height: SgSizes.spaceBtwItems,
                ),

                ///Overall Product Ratings
                const SgOverallProductRating(),
                const SgRatingBarIndicator(rating: 3.5),
                Text(
                  '12,611',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: SgSizes.spaceBtwSections,
                ),

                /// User Review List
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),
                const UserReviewCard(),
              ],
            )),
      ),
    );
  }
}
