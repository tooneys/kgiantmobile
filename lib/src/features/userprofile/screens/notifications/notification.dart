import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/notification_controller.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'widgets/single_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController.instance;

    return Scaffold(
      appBar: KAppBar(
        showBackArrow: true,
        title: Text(
          '알림',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        actions: [
          TextButton(
            onPressed: () => controller.clearStorage(),
            child: Text(
              'Clear all',
              style: Theme.of(context).textTheme.bodyMedium!.apply(color: KColors.primary),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Obx(
            () {
              if (controller.countNotification.value != 0) {
                return Column(
                  children: controller.listNotification.map((jsonData) => KSingleNotification(data: jsonData)).toList(),
                );
              } else {
                return const Center(child: Text('No Data Found'));
              }
            },
          ),
        ),
      ),
    );
  }
}
