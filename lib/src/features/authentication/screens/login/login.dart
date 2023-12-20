import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/styles/spacing_styles.dart';
import 'package:kgiantmobile/src/common/widgets/form_divider.dart';
import 'package:kgiantmobile/src/common/widgets/social_buttons.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

import 'widgets/login_form.dart';
import 'widgets/login_header.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: KSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Logo, Title & sub-Title
              LoginHeader(),

              /// Form
              LoginForm(),

              /// Divider
              FormDivider(dividerText: 'Or Sign in With'),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// Footer
              SocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
