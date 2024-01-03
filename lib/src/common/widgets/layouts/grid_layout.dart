import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class KGridLayout extends StatelessWidget {
  const KGridLayout({
    super.key,
    required this.itemCount,
    this.mainAxisExtent = 200,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: KSizes.gridViewSpacing,
        crossAxisSpacing: KSizes.gridViewSpacing,
        mainAxisExtent: mainAxisExtent,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
