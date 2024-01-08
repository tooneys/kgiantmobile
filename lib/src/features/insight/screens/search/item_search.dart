import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/features/insight/controllers/search/qrcode_controller.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class ItemSearchScreen extends StatelessWidget {
  const ItemSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(QRCodeScanController());
    return Scaffold(
      appBar: const KAppBar(
        title: Text('제품으로 검색'),
        showBackArrow: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Obx(
              () => Text('스캔 결과 : ${controller.barcode}', style: Theme.of(context).textTheme.bodyLarge),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.scan(),
        tooltip: '스캔',
        child: const Icon(Iconsax.camera),
      ),
    );
  }
}
