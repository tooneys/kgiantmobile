import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/image_text/circular_image_text.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/shimmer.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/change_name.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/change_phonenumber.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/change_username.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/formatter/formatter.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

import 'widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return SafeArea(
      child: Scaffold(
        appBar: const KAppBar(
          showBackArrow: true,
          title: Text('계정'),
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
                      Obx(() {
                        final networkImage = controller.user.value.profilePicture;
                        final image = networkImage.isNotEmpty ? networkImage : KImage.user;

                        return controller.imageUploading.value
                            ? const KShimmerEffect(width: 80, height: 80, radius: 80)
                            : KCircularImage(image: image, width: 80, height: 80, isNetworkImage: networkImage.isNotEmpty);
                      }),
                      TextButton(onPressed: () => controller.uploadUserProfilePicture(), child: const Text('Change Profile Picture')),
                    ],
                  ),
                ),

                // details
                const SizedBox(height: KSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: KSizes.spaceBtwItems),

                // Heading profile info
                KSectionHeading(title: '사용자 정보', onPressed: () {}, showActionButton: false),
                const SizedBox(height: KSizes.spaceBtwItems),

                KProfileMenu(
                  title: '성명',
                  value: controller.user.value.fullName,
                  onPressed: () => Get.to(() => const KProfileChangeName()),
                ),
                KProfileMenu(
                  title: '사용자명',
                  value: controller.user.value.userName,
                  onPressed: () => Get.to(() => const KProfileChangeUsername()),
                ),

                const SizedBox(height: KSizes.spaceBtwItems),
                const Divider(),
                const SizedBox(height: KSizes.spaceBtwItems),

                KSectionHeading(title: '개인 정보', onPressed: () {}, showActionButton: false),
                const SizedBox(height: KSizes.spaceBtwItems),

                KProfileMenu(
                  title: '사용자 ID',
                  value: controller.user.value.id,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: controller.user.value.id));
                    KLoaders.successSnackBar(title: 'ID 복사', message: '복사 되었습니다.');
                  },
                ),
                KProfileMenu(
                  title: 'E-Mail',
                  value: controller.user.value.email,
                  icon: Iconsax.copy,
                  onPressed: () {
                    Clipboard.setData(ClipboardData(text: controller.user.value.email));
                    KLoaders.successSnackBar(title: 'E-Mail 복사', message: '복사 되었습니다.');
                  },
                ),
                KProfileMenu(
                  title: 'Phone',
                  value: KFormatter.formatPhoneNumber(controller.user.value.phoneNumber),
                  onPressed: () => Get.to(() => const KProfileChangePhoneNumber()),
                ),
                //KProfileMenu(title: '성별', value: '남', onPressed: () {}),
                //KProfileMenu(title: '생년월일', value: '1999년 9월 9일', onPressed: () {}),

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
      ),
    );
  }
}
