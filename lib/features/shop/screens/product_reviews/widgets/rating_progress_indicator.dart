import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';

class SgRatingProgressIndicator extends StatelessWidget {
  const SgRatingProgressIndicator({
    super.key,
    required this.text,
    required this.value,
  });

  final String text;
  final double value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            )),
        Expanded(
          flex: 11,
          child: LinearProgressIndicator(
            value: value,
            minHeight: 11,
            backgroundColor: SgColors.grey,
            borderRadius: BorderRadius.circular(7),
            valueColor: const AlwaysStoppedAnimation(SgColors.primary),
          ),
        )
      ],
    );
  }
}
