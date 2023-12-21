import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class KRoundedIcon extends StatelessWidget {
  const KRoundedIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.icon,
    this.applyIconRadius = true,
    this.border,
    this.backgroundColor = KColors.light,
    this.fit,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = KSizes.md,
  });

  final double? width, height, size;
  final IconData icon;
  final bool applyIconRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(borderRadius),
            color: backgroundColor),
        child: ClipRRect(
          borderRadius: applyIconRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Icon(icon, size: size),
          // 향후 이미지 확보가 되면 변경가능성 있음.
          //Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
