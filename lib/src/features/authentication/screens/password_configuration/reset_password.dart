import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/forget_password/forgot_password_controller.dart';
import 'package:kgiantmobile/src/features/authentication/screens/login/login.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({
    super.key,
    required this.email,
  });

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.back(),
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
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              ///Email & Title & SubTitle
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(KTexts.forgotPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwItems),
              Text(KTexts.forgotPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox(height: KSizes.spaceBtwSections),

              ///Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(KTexts.done),
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.resendPasswordResetEmail(email),
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
