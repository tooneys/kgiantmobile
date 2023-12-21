import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KSettingsMenuTile extends StatelessWidget {
  const KSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 20,
        color: KColors.primary,
      ),
      title: title.isEmpty
          ? null
          : Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
      subtitle: subTitle.isEmpty
          ? null
          : Text(
              subTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
