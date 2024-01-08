import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/common/widgets/tile/settings_menu_tile.dart';
import 'package:kgiantmobile/src/features/insight/screens/search/code_search.dart';
import 'package:kgiantmobile/src/features/insight/screens/search/item_search.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class SearchInfomationScreen extends StatelessWidget {
  const SearchInfomationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KPrimaryHeaderContainer(
              child: Column(
                children: [
                  KAppBar(
                    title: Text(
                      '제품 검색',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: KColors.white),
                    ),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: Column(
                children: [
                  const KSectionHeading(
                    title: '제품 검색방법',
                  ),
                  const SizedBox(
                    height: KSizes.spaceBtwSections,
                  ),
                  KSettingsMenuTile(
                    title: '코드로 검색',
                    subTitle: '',
                    icon: Iconsax.barcode,
                    onTap: () => Get.to(() => const CodeSearchScreen()),
                  ),
                  const SizedBox(
                    height: KSizes.spaceBtwItems / 2,
                  ),
                  KSettingsMenuTile(
                    title: '제품으로 검색',
                    subTitle: '',
                    icon: Iconsax.monitor,
                    onTap: () => Get.to(() => const ItemSearchScreen()),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
