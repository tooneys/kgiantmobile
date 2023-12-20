
import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/curved_edges/curved_edges.dart';

class KCurvedEdgeWidget extends StatelessWidget {
  const KCurvedEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: KCustomCurvedEdges(),
      child: child,
    );
  }
}
