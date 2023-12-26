import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/user/user_repository.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/user_controller.dart';
import 'package:kgiantmobile/src/features/userprofile/screens/profile/profile.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateNameGlobalKey = GlobalKey<FormState>();

  @override
  void onInit() {
    // TODO: implement onInit
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
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

      if (!updateNameGlobalKey.currentState!.validate()) {
        KFullScreenLoader.stopLoading();
        return;
      }

      Map<String, dynamic> name = {'Firstname': firstName.text.trim(), 'Lastname': lastName.text.trim()};
      await userRepository.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      KFullScreenLoader.stopLoading();

      KLoaders.successSnackBar(title: '축하드립니다!!', message: '고객님의 이름이 변경되었습니다.');

      Get.off(() => const ProfileScreen());
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Oops', message: e.toString());
    }
  }
}
