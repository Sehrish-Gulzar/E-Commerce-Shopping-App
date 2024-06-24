import 'package:flutter/material.dart';

class SgProductPriceText extends StatelessWidget {
  const SgProductPriceText(
      {super.key,
      this.currencySign = '\$',
      required this.price,
      this.isLarge = false,
      this.maxLines = 1,
      this.lineThrough = false});

  final String currencySign, price;
  final int maxLines;
  final bool isLarge, lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
