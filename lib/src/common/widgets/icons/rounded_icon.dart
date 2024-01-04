import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/shimmer.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class KRoundedIcon extends StatelessWidget {
  const KRoundedIcon({
    super.key,
    this.width,
    this.height,
    this.size,
    required this.imageUrl,
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
  final String imageUrl;
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
        decoration: BoxDecoration(border: border, borderRadius: BorderRadius.circular(borderRadius), color: backgroundColor),
        child: ClipRRect(
          borderRadius: applyIconRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  fit: fit,
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, progress) => const KShimmerEffect(width: 64, height: 64),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(fit: fit, image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
