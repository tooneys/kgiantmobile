import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/curved_edges/curved_edges_widget.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KPrimaryHeaderContainer extends StatelessWidget {
  const KPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return KCurvedEdgeWidget(
      child: Container(
        color: KColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CircleContainer(
                    backgroundColor: KColors.white.withOpacity(0.1)),
              ),
              Positioned(
                  top: 100,
                  right: -300,
                  child: CircleContainer(
                      backgroundColor: KColors.white.withOpacity(0.1))),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
