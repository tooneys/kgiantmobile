import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/register/register_controller.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';

class RegisterConditionCheck extends StatelessWidget {
  const RegisterConditionCheck({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = KHelperFunctions.isDarkMode(context);
    final controller = RegisterController.instance;
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),
        const SizedBox(width: KSizes.spaceBtwItems),
        Text.rich(TextSpan(children: [
          // TextSpan(
          //     text: 'I agree to ',
          //     style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: '개인정보를 수집',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? KColors.white : KColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? KColors.white : KColors.primary,
                ),
          ),
          TextSpan(
            text: ', ',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          TextSpan(
            text: '이용 ',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? KColors.white : KColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? KColors.white : KColors.primary,
                ),
          ),
          TextSpan(
            text: '하는데 동의하시겠습니까 ?',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ])),
      ],
    );
  }
}
