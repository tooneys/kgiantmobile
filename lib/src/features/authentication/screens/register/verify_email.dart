import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/register/verify_email_controller.dart';
import 'package:kgiantmobile/src/features/authentication/screens/login/login.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({
    super.key,
    required this.email,
  });

  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              ///Image
              Image(
                image: const AssetImage(KImage.verifyImage),
                width: KHelperFunctions.screenWidth() * 0.6,
                height: KHelperFunctions.screenHeight() * 0.3,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              ///Title & subTitle
              Text(
                '이메일 주소를 확인하세요!',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),

              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSizes.spaceBtwItems),

              Text(
                '계정 보안을 강화하려면 이메일 주소를 확인하세요!',
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text('Continue'),
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: const Text(KTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
