import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class KVerticalImageText extends StatelessWidget {
  const KVerticalImageText({
    super.key,
    required this.icon,
    required this.title,
    this.textColor = KColors.white,
    this.backgroundColor = KColors.white,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final darkMode = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: KSizes.spaceBtwItems * 1.5),
        child: Column(
          children: [
            /// Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(KSizes.ss),
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (darkMode ? KColors.black : KColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Icon(icon, size: KSizes.iconLg),
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
