import 'package:flutter/cupertino.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';

class KShadowStyle {
  /// vertical
  static final verticalProductShadow = BoxShadow(
    color: KColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );

  /// horizontal
  static final horizontalProductShadow = BoxShadow(
    color: KColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2),
  );
}
