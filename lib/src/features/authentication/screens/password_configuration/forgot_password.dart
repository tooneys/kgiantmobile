import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/features/authentication/screens/login/login.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'reset_password.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///Header
            Text(
              'Forgot password ?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: KSizes.spaceBtwItems),
            Text(
              'Don\'t worry sometimes people can forget too. enter your Email and we will send you as password reset link',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: KSizes.spaceBtwSections * 2),

            /// text field
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'E-Mail', prefixIcon: Icon(Iconsax.direct_right)),
            ),
            const SizedBox(height: KSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => ResetPasswordScreen()),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
