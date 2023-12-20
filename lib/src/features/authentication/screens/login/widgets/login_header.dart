import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Image(
          height: 150,
          // darkmode
          image: AssetImage(KImage.appLogoImage),
        ),
        Text(
          '환영합니다',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: KSizes.ss),
        Text(
          '케이언트를 방문해 주셔서 감사합니다.',
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.start,
        ),
      ],
    );
  }
}
