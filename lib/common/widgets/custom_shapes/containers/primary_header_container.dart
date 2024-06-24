import 'package:flutter/cupertino.dart';

import '../../../../utils/constants/colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class SgPrimaryHeaderContainer extends StatelessWidget {
  const SgPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SgCurvedEdgesWidget(
      child: Container(
        color: SgColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            /// Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: SgCircularContainer(
                backgroundColor: SgColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: SgCircularContainer(
                backgroundColor: SgColors.textWhite.withOpacity(0.1),
              ),
            ),
            child
          ],
        ),
      ),
    );
  }
}
