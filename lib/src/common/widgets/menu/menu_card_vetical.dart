import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/styles/shadows.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:kgiantmobile/src/common/widgets/icons/rounded_icon.dart';
import 'package:kgiantmobile/src/common/widgets/texts/menu_text.dart';
import 'package:kgiantmobile/src/features/insight/models/category_model.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class KProductCardVertical extends StatelessWidget {
  const KProductCardVertical({
    super.key,
    required this.category,
  });

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final darkMode = KHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        if (category.id != null) {
          debugPrint('/${category.id}');
          Get.toNamed('/${category.id}');
        }
      },
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
              height: 100,
              padding: const EdgeInsets.all(KSizes.ss),
              backgroundColor: darkMode ? KColors.dark : KColors.light,
              child: KRoundedIcon(
                imageUrl: category.image,
                applyIconRadius: true,
                size: 90,
              ),
            ),
            const SizedBox(
              height: KSizes.spaceBtwItems / 2,
            ),

            Padding(
              padding: const EdgeInsets.only(left: KSizes.ss),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KMenuText(title: category.name, smallSize: false),
                    const SizedBox(height: KSizes.spaceBtwItems / 2),
                    //KMenuTitleWithVerifiedIcon(title: '영업'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
