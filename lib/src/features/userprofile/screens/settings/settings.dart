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
import 'package:kgiantmobile/src/features/userprofile/screens/security/personalsecurity.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
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
                  KAppBar(
                    title: Text(
                      '사용자 계정',
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: KColors.white),
                    ),
                  ),
                  KUserProfileTile(image: KImage.user, onPressed: () => Get.to(() => const ProfileScreen())),
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
                  KSettingsMenuTile(
                    title: '개인정보취급방침',
                    subTitle: '',
                    icon: Iconsax.personalcard,
                    onTap: () => Get.to(() => const PersonalSecurity()),
                  ),
                  const SizedBox(height: KSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => Get.put(LogoutController()).signOut(),
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
