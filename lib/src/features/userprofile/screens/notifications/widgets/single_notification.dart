
import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/custom_shape/containers/rounded_container.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/models/notification_model.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class KSingleNotification extends StatelessWidget {
  const KSingleNotification({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final darkMode = KHelperFunctions.isDarkMode(context);

    NotificationModel model = NotificationModel.fromJson(data);

    return KRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: darkMode ? KColors.dark.withOpacity(0.5) : KColors.light.withOpacity(0.5),
      borderColor: darkMode ? KColors.darkerGrey : KColors.grey,
      margin: const EdgeInsets.only(bottom: KSizes.spaceBtwItems),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.title,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: KSizes.ss / 2,
            ),
            Text(
              model.body,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: KSizes.ss / 2,
            ),
            Text(
              model.payload,
              style: Theme.of(context).textTheme.titleLarge,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
