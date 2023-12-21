import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/image_text/vertical_image_text.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';

class KHomeCategories extends StatelessWidget {
  const KHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return KVerticalImageText(
            icon: KImage.salesIcon,
            title: 'Menu',
            onTap: () {},
          );
        },
      ),
    );
  }
}
