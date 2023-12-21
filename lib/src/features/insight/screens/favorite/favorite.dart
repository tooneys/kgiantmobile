import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/icons/circular_icon.dart';
import 'package:kgiantmobile/src/common/widgets/layouts/grid_layout.dart';
import 'package:kgiantmobile/src/common/widgets/menu/menu_card_vetical.dart';
import 'package:kgiantmobile/src/features/insight/screens/home/home.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: Text(
          '즐겨찾기',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          KCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(() => const HomeScreen()),)
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              KGridLayout(mainAxisExtent: 250, itemCount: 6, itemBuilder: (_, index) => const KProductCardVertical()),
            ],
          ),
        ),
      ),
    );
  }
}
