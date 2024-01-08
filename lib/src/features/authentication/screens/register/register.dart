import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/form_divider.dart';
import 'package:kgiantmobile/src/common/widgets/social_buttons.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';

import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// Title
              Text(
                KTexts.registerTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Form
              const RegisterForm(),
              const SizedBox(height: KSizes.spaceBtwSections),

              ///divider
              FormDivider(
                dividerText: 'Or Register With'.capitalize!,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// social Button
              const SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
