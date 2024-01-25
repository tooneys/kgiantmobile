import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class PersonalSecurity extends StatelessWidget {
  const PersonalSecurity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KAppBar(
        title: Text(
          '개인정보 취급방침',
          style: Theme.of(context).textTheme.headlineSmall!.apply(color: KColors.black),
        ),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: KSizes.defaultSpace),
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse('http://k-giant.co.kr/etc/privacy.php')),
          initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(useHybridComposition: true),
          ),
        ),
      ),
    );
  }
}
