import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/validator/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const KAppBar(
        title: Text('Re-Authenticate User'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              Form(
                key: controller.reAuthFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: (value) => KValidator.validateEmail(value),
                      expands: false,
                      decoration: const InputDecoration(
                        labelText: 'E-Mail',
                        prefixIcon: Icon(Iconsax.direct_right),
                      ),
                    ),
                    const SizedBox(
                      height: KSizes.spaceBtwInputFields,
                    ),
                    Obx(
                      () => TextFormField(
                        controller: controller.verifyPassword,
                        validator: (value) => KValidator.validateEmptyText('Password', value),
                        expands: false,
                        obscureText: controller.isHidePassword.value,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            icon: Icon(controller.isHidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                            onPressed: () => controller.isHidePassword.value = !controller.isHidePassword.value,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: KSizes.spaceBtwSections,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.reAuthenticationEmailAndPasswordUser(),
                        child: const Text('Verify'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
