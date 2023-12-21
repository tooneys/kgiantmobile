import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class KMenuTitleWithVerifiedIcon extends StatelessWidget {
  const KMenuTitleWithVerifiedIcon({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(height: KSizes.xs),
        const Icon(
          Iconsax.shop,
          color: KColors.primary,
          size: KSizes.iconXs,
        ),
      ],
    );
  }
}
