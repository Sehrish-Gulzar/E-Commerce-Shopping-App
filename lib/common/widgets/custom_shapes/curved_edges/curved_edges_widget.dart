import 'package:flutter/material.dart';

import 'curved_edges.dart';

class SgCurvedEdgesWidget extends StatelessWidget {
  const SgCurvedEdgesWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SgCustomCurvedEdges(),
      child: child,
    );
  }
}
