import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/image_text/circular_image_text.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/change_name.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const KAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              // profile picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    const KCircularImage(image: KImage.user, width: 80, height: 80),
                    TextButton(onPressed: () {}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              // details
              const SizedBox(height: KSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              // Heading profile info
              KSectionHeading(title: 'Profile Information', onPressed: () {}, showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),

              KProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed: () => Get.to(
                  () => const KProfileChangeName(),
                ),
              ),
              KProfileMenu(title: 'UserName', value: controller.user.value.userName, onPressed: () {}),

              const SizedBox(height: KSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              KSectionHeading(title: 'Personal Information', onPressed: () {}, showActionButton: false),
              const SizedBox(height: KSizes.spaceBtwItems),

              KProfileMenu(title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy, onPressed: () {}),
              KProfileMenu(title: 'E-Mail', value: controller.user.value.email, onPressed: () {}),
              KProfileMenu(title: 'Phone Number', value: controller.user.value.phoneNumber, onPressed: () {}),
              KProfileMenu(title: 'Gender', value: '남', onPressed: () {}),
              KProfileMenu(title: 'Date of Birth', value: '1987년 1월 9일', onPressed: () {}),

              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    '계정 삭제',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
