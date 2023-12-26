import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/forget_password/forgot_password_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';
import 'package:kgiantmobile/src/utils/validator/validation.dart';


class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Header
            Text(
              '비밀번호를 잊어버렸나요 ?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: KSizes.spaceBtwItems),
            Text(
              '비밀번호를 잊어버렸을 때 걱정하지 마세요. 이메일을 입력하시면 비밀번호 재설정 링크를 보내드립니다.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: KSizes.spaceBtwSections * 2),

            /// text field
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: (value) => KValidator.validateEmail(value),
                decoration: const InputDecoration(labelText: 'E-Mail', prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(KTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
