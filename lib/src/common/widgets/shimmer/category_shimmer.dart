import 'package:flutter/widgets.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/shimmer.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class KCategoryShimmer extends StatelessWidget {
  const KCategoryShimmer({
    super.key,
    this.itemCount = 6,
    this.width = 55,
    this.imageHeight = 55,
    this.radius = 55,
    this.textHeight = 8,
  });

  final int itemCount;
  final double width, imageHeight, radius, textHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: KSizes.spaceBtwItems),
        itemBuilder: (_, __) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              KShimmerEffect(width: width, height: imageHeight, radius: radius),
              const SizedBox(height: KSizes.spaceBtwItems / 2),
              KShimmerEffect(width: width, height: textHeight),
            ],
          );
        },
      ),
    );
  }
}
