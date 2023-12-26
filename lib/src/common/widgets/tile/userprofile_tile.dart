import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/icons/circular_icon.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KUserProfileTile extends StatelessWidget {
  const KUserProfileTile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const KCircularIcon(icon: Iconsax.user, height: 50, width: 50),
      title: Text(controller.user.value.fullName,
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: KColors.white)),
      subtitle:
          Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: KColors.white)),
      trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: KColors.white)),
    );
  }
}
