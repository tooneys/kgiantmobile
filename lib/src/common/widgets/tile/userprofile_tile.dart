import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/icons/circular_icon.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KUserProfileTile extends StatelessWidget {
  const KUserProfileTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const KCircularIcon(
        //현재아이콘으로 사용중이지만 향후 회원사진으로 변경가능
        icon: Iconsax.user,
        height: 50,
        width: 50,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: KColors.white,
            ),
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: KColors.white,
            ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          Iconsax.edit,
          color: KColors.white,
        ),
      ),
    );
  }
}
