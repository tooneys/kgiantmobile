import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/styles/shadows.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:kgiantmobile/src/common/widgets/icons/circular_icon.dart';
import 'package:kgiantmobile/src/common/widgets/icons/menu_title_icon.dart';
import 'package:kgiantmobile/src/common/widgets/icons/rounded_icon.dart';
import 'package:kgiantmobile/src/common/widgets/texts/menu_text.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class KProductCardVertical extends StatelessWidget {
  const KProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = KHelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [KShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(KSizes.productImageRadius),
          color: darkMode ? KColors.darkerGrey : KColors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            /// 썸네일, 위시리스트 버튼, 가격
            KRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(KSizes.ss),
              backgroundColor: darkMode ? KColors.dark : KColors.light,
              child: const Stack(
                children: [
                  /// 썸네일 이미지
                  KRoundedIcon(
                    icon: Iconsax.activity,
                    applyIconRadius: true,
                    size: 150,
                  ),

                  /// sale tag
                  // Positioned(
                  //   top: 12,
                  //   child: KRoundedContainer(
                  //     radius: KSizes.ss,
                  //     backgroundColor: KColors.secondary.withOpacity(0.8),
                  //     padding: EdgeInsets.symmetric(
                  //         horizontal: KSizes.ss, vertical: KSizes.xs),
                  //     child: Text(
                  //       '25%',
                  //       style: Theme.of(context).textTheme.labelLarge!.apply(
                  //             color: KColors.black,
                  //           ),
                  //     ),
                  //   ),
                  // ),

                  /// 즐겨찾기 버튼
                  Positioned(
                    top: 0,
                    right: 0,
                    child: KCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems / 2,
            ),

            /// 상세
            /// 가격
            const Padding(
              padding: EdgeInsets.only(left: KSizes.ss),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KMenuText(title: '주간매출판매분석', smallSize: false),
                    SizedBox(height: KSizes.spaceBtwItems / 2),
                    KMenuTitleWithVerifiedIcon(title: '영업'),
                  ],
                ),
              ),
            ),
            // const Spacer(),
            //
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //       '\$ 35.5',
            //       maxLines: 1,
            //       overflow: TextOverflow.ellipsis,
            //       style: Theme.of(context).textTheme.headlineMedium,
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //         color: KColors.dark,
            //         borderRadius: BorderRadius.only(
            //           topLeft: Radius.circular(KSizes.cardRadiusMd),
            //           bottomRight:
            //               Radius.circular(KSizes.productImageRadius),
            //         ),
            //       ),
            //       child: SizedBox(
            //         width: KSizes.iconLg * 1.2,
            //         height: KSizes.iconLg * 1.2,
            //         child: Icon(
            //           Iconsax.add,
            //           color: KColors.white,
            //           size: KSizes.iconMd,
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
