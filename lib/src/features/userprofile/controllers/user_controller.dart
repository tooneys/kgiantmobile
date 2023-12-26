import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/data/repositories/user/user_repository.dart';
import 'package:kgiantmobile/src/features/authentication/models/user_model.dart';
import 'package:kgiantmobile/src/features/authentication/screens/login/login.dart';
import 'package:kgiantmobile/src/features/authentication/screens/login/reauth_login.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  final isHidePassword = false.obs;

  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  final localStorage = GetStorage();

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final nameParts = UserModel.nameParts(userCredential.user!.displayName ?? '');
        final username = UserModel.generateUsername(userCredential.user!.displayName ?? '');

        // data
        final user = UserModel(
          id: userCredential.user!.uid,
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
          userName: username,
          email: userCredential.user!.email ?? '',
          phoneNumber: userCredential.user!.phoneNumber ?? '',
          profilePicture: userCredential.user!.photoURL ?? '',
          companyCode: '',
        );

        // save user record
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      KLoaders.warningSnackBar(title: 'Data not saved', message: e.toString());
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchUserRecord();
  }

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(KSizes.md),
      title: '계정 삭제',
      middleText: '계정을 삭제하시겠습니까? \n삭제후에는 데이터를 되살릴수 없습니다.',
      confirm: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        onPressed: () async => deleteAccount(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: KSizes.lg),
          child: Text('삭제'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('취소'),
      ),
    );
  }

  /// 계정 삭제
  void deleteAccount() async {
    try {
      KFullScreenLoader.openLoadingDialog('처리중...', KImage.loadingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          KFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          ///login 되어있는 메일 불러주기
          verifyEmail.text = user.value.email;

          KFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }

  Future<void> reAuthenticationEmailAndPasswordUser() async {
    try {
      KFullScreenLoader.openLoadingDialog('처리중...', KImage.loadingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      ///로컬저장소에 계정 패스워드 삭제
      localStorage.remove('REMEMBER_ME_EMAIL');
      localStorage.remove('REMEMBER_ME_PASSWORD');
      localStorage.remove('IsFirstTime');

      KFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
