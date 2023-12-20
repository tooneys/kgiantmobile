import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/device/device_utility.dart';
import 'package:kgiantmobile/src/utils/helper_function/helper_function.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNavigation extends StatelessWidget {
  const OnBoardingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final dark = KHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: DeviceUtil.getBottomNavigationBarHeight(),
      left: KSizes.defaultSpace,
      child: SmoothPageIndicator(
        count: 3,
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
            activeDotColor: dark ? Colors.white : Colors.black, dotHeight: 6),
      ),
    );
  }
}
