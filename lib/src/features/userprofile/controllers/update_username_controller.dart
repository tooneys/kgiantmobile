import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/user/user_repository.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/profile.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class UpdateUsernameController extends GetxController {
  static UpdateUsernameController get instance => Get.find();

  final userName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameGlobalKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    userName.text = userController.user.value.userName;
  }

  Future<void> updateUserName() async {
    try {
      KFullScreenLoader.openLoadingDialog(
        '정보를 업데이트 중입니다...',
        KImage.loadingAnimation,
      );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      if (!updateUserNameGlobalKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'Username': userName.text.trim()};
      await userRepository.updateSingleField(name);

      /// userController 에 유저명 변경
      /// error 이미 초기화 되었다 ?
      userController.user.value.userName = userName.text.trim();

      KFullScreenLoader.stopLoading();

      KLoaders.successSnackBar(title: '축하드립니다!!', message: '고객님의 유저ID가 변경되었습니다.');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      KFullScreenLoader.stopLoading();
      debugPrint(e.toString());
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
