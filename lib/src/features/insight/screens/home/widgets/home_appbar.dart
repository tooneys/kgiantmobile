import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/notification/notification_icon.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/shimmer.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/notifications/notification.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';

class KHomeAppBar extends StatelessWidget {
  const KHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return KAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(KTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: KColors.grey)),
          Obx(
            () {
              if (controller.profileLoading.value) {
                return const KShimmerEffect(width: 80, height: 15);
              } else {
                return Text(
                  controller.user.value.fullName,
                  style: Theme.of(context).textTheme.headlineSmall!.apply(
                        color: KColors.white,
                      ),
                );
              }
            },
          ),
        ],
      ),
      actions: [
        KNotiCountIcon(
          onPressed: () => Get.to(() => const NotificationScreen()),
          iconColor: KColors.white,
        ),
      ],
    );
  }
}
