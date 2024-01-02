import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/notification_controller.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KNotiCountIcon extends StatelessWidget {
  const KNotiCountIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
  });

  final VoidCallback onPressed;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    final controller = NotificationController.instance;

    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.notification,
            color: iconColor,
          ),
        ),
        Obx(
          () => Positioned(
            right: 0,
            child: Container(
              width: controller.countNotification.value == 0 ? 0 : 18,
              height: controller.countNotification.value == 0 ? 0 : 18,
              decoration: BoxDecoration(color: Colors.red.withOpacity(0.5), borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text(
                  '${controller.countNotification.value}',
                  style: Theme.of(context).textTheme.labelLarge!.apply(color: KColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
