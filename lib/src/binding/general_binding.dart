import 'package:get/get.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
  }
}
