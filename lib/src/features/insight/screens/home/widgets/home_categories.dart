import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/image_text/vertical_image_text.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/category_shimmer.dart';
import 'package:kgiantmobile/src/features/insight/controllers/category_controller.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';

class KHomeCategories extends StatelessWidget {
  const KHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryContorller());
    return Obx(() {
      if (categoryController.isLoading.value) return const KCategoryShimmer();

      if (categoryController.featureCategories.isEmpty) {
        return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
      }

      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featureCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = categoryController.featureCategories[index];
            return KVerticalImageText(
              image: category.image,
              title: category.name,
              isNetworkImage: false,
              onTap: () {},
            );
          },
        ),
      );
    });
  }
}
