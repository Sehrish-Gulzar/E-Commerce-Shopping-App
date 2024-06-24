import 'package:e_commerce_shopping_app/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:flutter/material.dart';

class SgOverallProductRating extends StatelessWidget {
  const SgOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              '4.8',
              style: Theme.of(context).textTheme.displayLarge,
            )),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              SgRatingProgressIndicator(
                text: '5',
                value: 1.0,
              ),
              SgRatingProgressIndicator(
                text: '4',
                value: 0.8,
              ),
              SgRatingProgressIndicator(
                text: '3',
                value: 0.6,
              ),
              SgRatingProgressIndicator(
                text: '2',
                value: 0.4,
              ),
              SgRatingProgressIndicator(
                text: '1',
                value: 0.2,
              )
            ],
          ),
        )
      ],
    );
  }
}
