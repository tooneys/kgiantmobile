import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class LoginController extends GetxController {
  /// variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  /// Email and Password signIn
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
          '잠시만 기다려 주세요...', KImage.loadingAnimation);

      // CHeck Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is selected
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      // login user using Email & password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      KFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: "Oops", message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // Start Loading
      KFullScreenLoader.openLoadingDialog(
          '잠시만 기다려 주세요...', KImage.loadingAnimation);

      // CHeck Internet Connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // Google Auth
      final userCredential =
          await AuthenticationRepository.instance.signInWithGoogle();

      // Save user Record
      await userController.saveUserRecord(userCredential);

      // Remove Loading
      KFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      // Remove Loading
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    super.onInit();
  }
}
