import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/update_phoneno_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';
import 'package:kgiantmobile/src/utils/validator/validation.dart';

class KProfileChangePhoneNumber extends StatelessWidget {
  const KProfileChangePhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdatePhoneNoController());
    return SafeArea(
      child: Scaffold(
        appBar: const KAppBar(
          title: Text('휴대폰 번호 변경'),
          showBackArrow: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '휴대폰 번호를 변경합니다.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: KSizes.spaceBtwSections),
              Form(
                key: controller.updatePhoneNoGlobalKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.phoneNo,
                      validator: (value) => KValidator.validatePhoneNumber(value),
                      decoration: const InputDecoration(labelText: KTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
                      keyboardType: TextInputType.phone,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: KSizes.spaceBtwSections),

              /// save button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.updatePhoneNumber(),
                  child: const Text('변경'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
