import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/features/authentication/screens/register/verify_done.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  /// send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      KLoaders.successSnackBar(
          title: '이메일 전송!', message: '수신된 메일을 확인하여 주시기 바랍니다.');
    } catch (e) {
      KLoaders.errorSnackBar(title: 'Oops!', message: e.toString());
    }
  }

  /// time to automaticall redirect
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => VerifiedScreen(
            image: KImage.verifiedImage,
            title: '귀하의 계정이 성공적으로 생성되었습니다.',
            subTitle: 'K-giant에 오신 것을 환영합니다. \n귀하의 계정이 생성되었습니다',
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  /// maually check
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => VerifiedScreen(
          image: KImage.verifiedImage,
          title: '귀하의 계정이 성공적으로 생성되었습니다.',
          subTitle: 'K-giant에 오신 것을 환영합니다. \n귀하의 계정이 생성되었습니다',
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
