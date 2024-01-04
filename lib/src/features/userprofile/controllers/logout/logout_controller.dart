import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class LogoutController extends GetxController {
  static LogoutController get instance => Get.find();

  Future<void> signOut() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog('잠시만 기다려 주세요...', KImage.loadingAnimation);

      // CHeck Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // log out
      await AuthenticationRepository.instance.logout();

      // Remove Loader
      KFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: "Oops", message: e.toString());
    }
  }
}
