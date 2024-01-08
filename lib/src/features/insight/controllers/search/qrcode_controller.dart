import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class QRCodeScanController extends GetxController {
  static QRCodeScanController get instance => Get.find();

  RxString barcode = "".obs;

  Future<void> scan() async {
    try {
      //FlutterBarcodeScanner.getBarcodeStreamReceiver('#ff6666', '취소', true, ScanMode.BARCODE)!.listen((barcode) => print(barcode));

      String result = await FlutterBarcodeScanner.scanBarcode('#ff6666', '취소', true, ScanMode.BARCODE);
      print(result);
      barcode.value = result;
    } catch (e) {
      KLoaders.errorSnackBar(title: '에러', message: e.toString());
    }
  }
}
