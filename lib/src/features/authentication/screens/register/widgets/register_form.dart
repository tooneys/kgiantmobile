import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/register/register_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';
import 'package:kgiantmobile/src/utils/validator/validation.dart';

import 'register_condition_check.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    final controller = Get.put(RegisterController());
    return Form(
      key: controller.registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ///firstname
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      KValidator.validateEmptyText(KTexts.firstName, value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: KTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(width: KSizes.spaceBtwInputFields),

              ///lastname
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      KValidator.validateEmptyText(KTexts.lastName, value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: KTexts.lastName,
                      prefixIcon: Icon(Iconsax.user_edit)),
                ),
              ),
            ],
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          ///username
          TextFormField(
            controller: controller.userName,
            validator: (value) =>
                KValidator.validateEmptyText(KTexts.userName, value),
            expands: false,
            decoration: const InputDecoration(
                labelText: KTexts.userName,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          TextFormField(
            controller: controller.email,
            validator: (value) => KValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: KTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => KValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: KTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => KValidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              decoration: InputDecoration(
                labelText: KTexts.password,
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                  icon: controller.hidePassword.value
                      ? const Icon(Iconsax.eye_slash)
                      : const Icon(Iconsax.eye),
                ),
              ),
            ),
          ),
          const SizedBox(height: KSizes.spaceBtwInputFields),

          const RegisterConditionCheck(),
          const SizedBox(height: KSizes.spaceBtwSections),

          /// register button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.register(),
              child: const Text('계정 생성'),
            ),
          ),
        ],
      ),
    );
  }
}
