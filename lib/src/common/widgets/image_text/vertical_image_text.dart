import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/image_text/circular_image_text.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class KVerticalImageText extends StatelessWidget {
  const KVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = KColors.white,
    this.backgroundColor = KColors.white,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image;
  final String title;
  final Color textColor;
  final Color? backgroundColor;
  final bool isNetworkImage;
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
            KCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: KSizes.ss,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: darkMode ? KColors.light : KColors.dark,
            ),
            const SizedBox(height: KSizes.spaceBtwItems / 2),
            SizedBox(
              width: 55,
              child: Center(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(color: textColor),
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
