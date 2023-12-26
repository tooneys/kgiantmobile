import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/controllers/notification_screen_controller.dart';

class NotificationDetailsPage
    extends GetView<NotificationDetailsPageController> {
  const NotificationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationDetailsPageController());
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
          color: context.theme.colorScheme.secondary,
        ),
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'payload : ',
                style: TextStyle(
                  fontSize: 30,
                  color: context.theme.colorScheme.onBackground,
                ),
              ),
              Text(
                controller.argument.value,
                style: TextStyle(
                  fontSize: 30,
                  color: context.theme.colorScheme.onBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
