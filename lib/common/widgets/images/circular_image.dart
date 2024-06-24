import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../shimmer/shimmer_effect.dart';

class SgCircularImage extends StatelessWidget {
  const SgCircularImage(
      {super.key,
      this.width = 56,
      this.height = 56,
      this.overlayColor,
      this.backgroundColor,
      required this.image,
      this.fit = BoxFit.cover,
      this.padding = SgSizes.sm,
      this.isNetworkImage = false});

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    final dark = SgHelperFunctions.isDarkMode(context);

    return Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
            color: backgroundColor ?? (dark ? SgColors.dark : SgColors.light),
            borderRadius: BorderRadius.circular(100)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, progress) =>
                        const SgShimmerEffect(width: 55, height: 55),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  )
                : Image(
                    fit: fit,
                    image: AssetImage(image),
                    color: overlayColor,
                  ),
          ),
        ));
  }
}
