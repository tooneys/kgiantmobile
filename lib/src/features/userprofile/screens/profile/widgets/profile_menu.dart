import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class KProfileMenu extends StatelessWidget {
  const KProfileMenu({
    super.key,
    required this.title,
    required this.value,
    required this.onPressed,
    this.icon = Iconsax.arrow_right_34,
  });

  final IconData? icon;
  final String title, value;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 3,
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodySmall,
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
            flex: 5,
            child: Text(
              value,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              size: 10,
            ),
          ),
        ),
      ],
    );
  }
}
