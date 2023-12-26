import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/login/login_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller = Get.put(LoginController());

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () => controller.googleSignIn(),
            icon: const Icon(
              Icons.g_mobiledata,
            ),
          ),
        ),
        const SizedBox(width: KSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.facebook,
            ),
          ),
        ),
      ],
    );
  }
}
