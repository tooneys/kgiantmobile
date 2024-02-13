import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/update_name_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/constants/text_strings.dart';
import 'package:kgiantmobile/src/utils/validator/validation.dart';

class KProfileChangeName extends StatelessWidget {
  const KProfileChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: KAppBar(
        showBackArrow: true,
        title: Text(
          '이름 변경',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '확인을 위해 실명을 사용하세요. 이 이름은 여러 페이지에 나타납니다.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: KSizes.spaceBtwSections),
            Form(
              key: controller.updateNameGlobalKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => KValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: KTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                    keyboardType: TextInputType.name,
                  ),
                  const SizedBox(
                    height: KSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.lastName,
                    validator: (value) => KValidator.validateEmptyText('Last name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: KTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwSections),

            /// save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('변경'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
