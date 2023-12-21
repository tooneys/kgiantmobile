import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/data/repositories/user/user_repository.dart';
import 'package:kgiantmobile/src/features/authentication/models/user_model.dart';
import 'package:kgiantmobile/src/features/authentication/screens/register/verify_email.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // variables
  final hidePassword = true.obs; // observable password
  final privacyPolicy = false.obs; // observable privacyPolicy
  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  //register
  void register() async {
    try {
      ///start loading
      KFullScreenLoader.openLoadingDialog(
        '잠시만 기다려 주세요...',
        KImage.loadingAnimation,
      );

      ///check
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      /// form validation
      if (!registerFormKey.currentState!.validate()) {
        // remove loader
        KFullScreenLoader.stopLoading();
        return;
      }

      /// privacy policy check
      if (!privacyPolicy.value) {
        KLoaders.warningSnackBar(
          title: '개인정보 수집 및 이용',
          message: '개인정보를 수집 및 이용하는데 동의하지 않으셨습니다.',
        );
        return;
      }

      /// register firebase
      final userCredential =
          await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      /// save auth
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        userName: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
        companyCode: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // remove loader
      KFullScreenLoader.stopLoading();

      /// show success
      KLoaders.successSnackBar(
        title: '저장 성공',
        message: '계정이 생성되었습니다. 메일을 승인하여 주시기 바랍니다.',
      );

      /// move to verify email
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      debugPrint(e.toString());
      // remove loader
      KFullScreenLoader.stopLoading();
      // show error
      KLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
