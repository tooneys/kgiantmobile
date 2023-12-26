import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/primary_header_container.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/common/widgets/tile/settings_menu_tile.dart';
import 'package:kgiantmobile/src/common/widgets/tile/userprofile_tile.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/logout/logout_controller.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/notifications/notification.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/profile.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            KPrimaryHeaderContainer(
              child: Column(
                children: [
                  const KAppBar(title: Text('사용자 계정'), actions: []),
                  KUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: KSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(KSizes.defaultSpace),
              child: Column(
                children: [
                  const KSectionHeading(
                    title: '사용자 계정 세팅',
                  ),
                  const SizedBox(
                    height: KSizes.spaceBtwSections,
                  ),
                  KSettingsMenuTile(
                    title: '알림',
                    subTitle: '',
                    icon: Iconsax.notification,
                    onTap: () => Get.to(() => const NotificationScreen()),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Get.put(LogoutController()).SignOut(),
                      child: const Text('로그아웃'),
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
