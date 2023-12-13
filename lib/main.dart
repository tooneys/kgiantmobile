import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/screens/fcm_screen.dart';
import 'package:kgiantmobile/src/utils/theme.dart';

// main.dart
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KgiantMobile',
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      locale: Get.deviceLocale,
      debugShowCheckedModeBanner: false,
      home: App(),
    );
  }
}
