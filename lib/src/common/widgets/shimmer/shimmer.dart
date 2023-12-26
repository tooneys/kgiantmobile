import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';
import 'package:shimmer/shimmer.dart';

class KShimmerEffect extends StatelessWidget {
  const KShimmerEffect({
    super.key,
    required this.width,
    required this.height,
    this.radius = 15,
    this.color,
  });

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final darkMode = KHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: darkMode ? Colors.grey[500]! : Colors.grey[300]!,
      highlightColor: darkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (darkMode ? KColors.darkerGrey : KColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
