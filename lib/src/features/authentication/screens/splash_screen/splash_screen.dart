import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/constants/image_strings.dart';
import 'package:kgiantmobile/src/constants/sizes.dart';
import 'package:kgiantmobile/src/constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.yellow,
              ),
            ),
            //child: Image(image: AssetImage(tSplashImage),),
          ),
          Positioned(
            top: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tAppName,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  tAppTagLine,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 100,
            child: Image(
              width: 550,
              height: 700,
              image: AssetImage(tSplashImage),
              //fit: BoxFit.fitWidth,
            ),
          ),
          Positioned(
            bottom: 40,
            right: tDefaultSize,
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.yellow,
              ),
            ),
          )
        ],
      ),
    );
  }
}
