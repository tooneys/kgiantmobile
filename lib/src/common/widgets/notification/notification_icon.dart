import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KNotiCountIcon extends StatelessWidget {
  const KNotiCountIcon({
    super.key,
    required this.onPressed,
    required this.iconColor,
    required this.count,
  });

  final VoidCallback onPressed;
  final Color iconColor;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.notification,
            color: iconColor,
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: count == 0 ? 0 : 18,
            height: count == 0 ? 0 : 18,
            decoration: BoxDecoration(color: Colors.red.withOpacity(0.5), borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                '$count',
                style: Theme.of(context).textTheme.labelLarge!.apply(color: KColors.white, fontSizeFactor: 0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
