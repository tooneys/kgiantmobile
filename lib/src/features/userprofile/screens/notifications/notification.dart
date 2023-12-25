
import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'widgets/single_notification.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        showBackArrow: true,
        title: Text(
          '알림',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              KSingleNotification(),
              KSingleNotification(),
            ],
          ),
        ),
      ),
    );
  }
}
