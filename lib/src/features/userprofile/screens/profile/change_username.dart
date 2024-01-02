import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/update_username_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/validator/validation.dart';

class KProfileChangeUsername extends StatelessWidget {
  const KProfileChangeUsername({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateUsernameController());
    return Scaffold(
      appBar: KAppBar(
        showBackArrow: true,
        title: Text(
          '유저 ID 변경',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('유저 ID를 변경해 주세요.'),
            const SizedBox(height: KSizes.spaceBtwSections),
            Form(
              key: controller.updateUserNameGlobalKey,
              child: TextFormField(
                controller: controller.userName,
                validator: (value) => KValidator.validateEmptyText('유저 ID', value),
                expands: false,
                decoration: const InputDecoration(labelText: '유저 ID', prefixIcon: Icon(Iconsax.user_edit)),
              ),
            ),
            const SizedBox(height: KSizes.spaceBtwSections),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserName(),
                child: const Text('저장'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
