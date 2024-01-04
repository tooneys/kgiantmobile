import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:kgiantmobile/src/common/widgets/layouts/grid_layout.dart';
import 'package:kgiantmobile/src/common/widgets/menu/menu_card_vetical.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/category_shimmer.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/features/insight/controllers/category_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'widgets/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryContorller());
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

                  // /// Searchbar
                  // KSearchContainer(text: '메뉴 검색'),
                  // SizedBox(height: KSizes.spaceBtwSections),

                  // /// Categories
                  // Padding(
                  //   padding: EdgeInsets.only(left: KSizes.defaultSpace),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       /// heading
                  //       KSectionHeading(
                  //         title: '화면 목록',
                  //         showActionButton: false,
                  //       ),
                  //       SizedBox(height: KSizes.spaceBtwItems),

                  //       ///categories
                  //       KHomeCategories(),
                  //     ],
                  //   ),
                  // ),

                  // SizedBox(
                  //   height: KSizes.spaceBtwSections,
                  // ),
                ],
              ),
            ),

            /// 메뉴구성 리스트
            Padding(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: Column(
                children: [
                  const KSectionHeading(
                    title: '화면 목록',
                    showActionButton: false,
                  ),
                  const SizedBox(height: KSizes.spaceBtwItems / 2),
                  Obx(
                    () => KGridLayout(
                      itemCount: categoryController.featureCategories.length,
                      mainAxisExtent: 150,
                      itemBuilder: (_, index) {
                        if (categoryController.isLoading.value) {
                          return KCategoryShimmer(
                            width: 150,
                            imageHeight: 200,
                            textHeight: 20,
                            itemCount: categoryController.featureCategories.length,
                          );
                        }

                        if (categoryController.featureCategories.isEmpty) {
                          return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                        }
                        final category = categoryController.featureCategories[index];
                        return KProductCardVertical(
                          category: category,
                        );
                      },
                    ),
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
