import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/controllers/fcm_controller.dart';
import 'package:kgiantmobile/src/features/insight/screens/favorite/favorite.dart';
import 'package:kgiantmobile/src/features/insight/screens/home/home.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/settings/settings.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = KHelperFunctions.isDarkMode(context);
    final AppController c = Get.put(AppController());

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor: darkMode ? KColors.black : KColors.white,
          indicatorColor: darkMode
              ? KColors.white.withOpacity(0.1)
              : KColors.black.withOpacity(0.1),
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: '홈'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: '즐겨찾기'),
            NavigationDestination(icon: Icon(Iconsax.user), label: '사용자'),
          ],
        ),
      ),
      body: FutureBuilder<Object>(
        future: c.initialize(),
        builder: (context, snapshot) {
          return Obx(() => controller.screens[controller.selectedIndex.value]);
        }
      ),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const FavoriteScreen(),
    const SettingScreen(),
  ];
}
