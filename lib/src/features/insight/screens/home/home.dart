import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/search_container.dart';
import 'package:kgiantmobile/src/common/widgets/layouts/grid_layout.dart';
import 'package:kgiantmobile/src/common/widgets/menu/menu_card_vetical.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';
import 'widgets/home_categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// 상단 헤더
            const KPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// Appbar
                  KHomeAppBar(),
                  SizedBox(height: KSizes.spaceBtwSections),

                  /// Searchbar
                  KSearchContainer(text: '메뉴 검색'),
                  SizedBox(height: KSizes.spaceBtwSections),

                  /// Categories
                  Padding(
                    padding: EdgeInsets.only(left: KSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// heading
                        KSectionHeading(
                          title: 'Menu List',
                          showActionButton: false,
                        ),
                        SizedBox(height: KSizes.spaceBtwItems),

                        ///categories
                        KHomeCategories(),
                      ],
                    ),
                  ),

                  SizedBox(height: KSizes.spaceBtwSections,),
                ],
              ),
            ),

            /// 메뉴구성 리스트
            Padding(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: KGridLayout(
                itemCount: 4,
                mainAxisExtent: 250,
                itemBuilder: (_, index) => const KProductCardVertical(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
