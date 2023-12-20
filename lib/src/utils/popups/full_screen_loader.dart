import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';
import 'package:kgiantmobile/src/utils/loaders/animation_loader.dart';

class KFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => WillPopScope(
        onWillPop: () async {
          // Your custom logic here
          // Return true to allow back navigation, or false to prevent it.
          return false;
        },
        child: Container(
          color: KHelperFunctions.isDarkMode(Get.context!)
              ? KColors.dark
              : KColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(
                height: 250,
              ),
              KAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),


      //
      //     PopScope(
      //   canPop: false,
      //   child: Container(
      //     color: KHelperFunctions.isDarkMode(Get.context!)
      //         ? KColors.dark
      //         : KColors.white,
      //     width: double.infinity,
      //     height: double.infinity,
      //     child: Column(
      //       children: [
      //         const SizedBox(
      //           height: 250,
      //         ),
      //         KAnimationLoaderWidget(text: text, animation: animation),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
