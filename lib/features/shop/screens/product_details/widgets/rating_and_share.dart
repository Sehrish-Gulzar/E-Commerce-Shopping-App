import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class SgRatingAndShare extends StatelessWidget {
  const SgRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Rating
        Row(
          children: [
            const Icon(Iconsax.star5,
                size: SgSizes.iconMd, color: Colors.amber),
            const SizedBox(
              width: SgSizes.spaceBtwItems / 2,
            ),
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodyLarge,
                  children: const [
                    TextSpan(text: '5.0 '),
                    TextSpan(text: '(199)'),
                  ]),
            )
          ],
        ),

        /// Share Button
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.share,
            size: SgSizes.iconMd,
          ),
        )
      ],
    );
  }
}
