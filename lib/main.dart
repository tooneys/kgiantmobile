import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kgiantmobile/src/binding/general_binding.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/screens/fcm_screen.dart';
import 'package:kgiantmobile/src/features/insight/screens/analysis/sales/daily_analysis.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:kgiantmobile/src/utils/theme/theme.dart';

import 'firebase_options.dart';

// main.dart
Future<void> main() async {
  // Todo: Add Widget binding
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Todo : Init Local Storage
  await GetStorage.init();

  // Todo : Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Firebase 초기화
  // Firebase 초기화 부터 해야 Firebase Messaging 을 사용할 수 있다.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KgiantMobile',
      theme: KAppTheme.lightTheme,
      darkTheme: KAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBindings(),
      home: const Scaffold(
        backgroundColor: KColors.primary,
        body: Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        ),
      ),
      getPages: [
        GetPage(name: '/24DJtTKJqL8EcPpmAsdb', page: () => const DailyAnalysisScreen()),
        GetPage(name: '/IEVZ9WIpnpuoTDIuUWXI', page: () => App()),
      ],
    );
  }
}
