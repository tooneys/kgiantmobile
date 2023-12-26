import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  // Send Reset Email
  sendPasswordResetEmail() async {
    try {
      // start loading
      KFullScreenLoader.openLoadingDialog('잠시만 기다려 주세요...', KImage.loadingAnimation);

      // isConnection network
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      KFullScreenLoader.stopLoading();

      KLoaders.successSnackBar(title: 'E-mail 전송', message: '비밀번호 초기화 링크를 E-mail로 전송하였습니다.');

      Get.to(() => ResetPasswordScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  // resendPasswordResetEmail
  resendPasswordResetEmail(String email) async {
    try {
      // start loading
      KFullScreenLoader.openLoadingDialog('잠시만 기다려 주세요...', KImage.loadingAnimation);

      // isConnection network
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Remove loader
      KFullScreenLoader.stopLoading();

      // show Success Screen
      KLoaders.successSnackBar(title: 'E-mail 전송', message: '비밀번호 초기화 링크를 E-mail로 전송하였습니다.');
    } catch (e) {
      // Remove loader
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
