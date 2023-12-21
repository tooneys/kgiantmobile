import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/device/device_utility.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class KSearchContainer extends StatelessWidget {
  const KSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: KSizes.defaultSpace),
        child: Container(
          width: DeviceUtil.getScreenWidth(),
          padding: const EdgeInsets.all(KSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? darkMode
                    ? KColors.dark
                    : KColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(KSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: KColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: KColors.darkerGrey,
              ),
              const SizedBox(
                width: KSizes.spaceBtwItems,
              ),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
