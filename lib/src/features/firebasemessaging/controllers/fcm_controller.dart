import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/screens/notification_screen.dart';
import 'package:kgiantmobile/src/features/userprofile/controllers/notification_controller.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();

  final Rxn<RemoteMessage> message = Rxn<RemoteMessage>();
  final localStorage = GetStorage();
  final notificationController = Get.put(NotificationController());

  Future<bool> initialize() async {
    // Firebase 초기화부터 해야 Firebase Messaging 을 사용할 수 있다.
    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform,
    // );

    // Token 생성
    String? token = await FirebaseMessaging.instance.getToken();
    localStorage.writeIfNull('deviceToken', token);
    //debugPrint("Device Token : $token");

    // Android 에서는 별도의 확인 없이 리턴되지만, requestPermission()을 호출하지 않으면 수신되지 않는다.
    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    // iOS foreground에서 heads up display 표시를 위해 alert, sound true로 설정
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    // Android용 새 Notification Channel
    const AndroidNotificationChannel androidNotificationChannel = AndroidNotificationChannel(
      'high_importance_channel', // 임의의 id
      'High Importance Notifications', // 설정에 보일 채널명
      description: 'This channel is used for important notifications.', // 설정에 보일 채널 설명
      importance: Importance.max,
    );

    // Notification Channel을 디바이스에 생성
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(androidNotificationChannel);

    const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

    void onDidReceiveLocalNotification(int id, String? title, String? body, String? payload) async {
      // display a dialog with the notification details, tap ok to go to another page
      Get.to(() => const NotificationDetailsPage(), arguments: payload);
    }

    final DarwinInitializationSettings initializationSettingsIos =
        DarwinInitializationSettings(onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) async {
      final String? payload = notificationResponse.payload;
      if (notificationResponse.payload != null) {
        debugPrint('notification payload: $payload');
      }
      Get.to(() => const NotificationDetailsPage(), arguments: payload);
    }

    // FlutterLocalNotificationsPlugin 초기화. 이 부분은 notification icon 부분에서 다시 다룬다.
    await flutterLocalNotificationsPlugin.initialize(
      InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIos),
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage rm) {
      message.value = rm;
      RemoteNotification? notification = rm.notification;
      AndroidNotification? android = rm.notification?.android;

      if (notification != null && android != null) {
        print('title is : ${notification.title}');

        /// local Storage message save
        notificationController.saveStorage({
          'title': notification.title,
          'body': notification.body,
          'payload': rm.data['argument'],
        });

        /// push Notification
        flutterLocalNotificationsPlugin.show(
          0,
          notification.title,
          notification.body,
          const NotificationDetails(
            android: AndroidNotificationDetails(
              'high_importance_channel', // 임의의 id
              'High Importance Notifications', // 설정에 보일 채널명
              channelDescription: 'This is channel is used for important notifications.', // 설정에 보일 채널 설명
            ),
          ),
          // 여기서는 간단하게 data 영역의 임의의 필드(ex. argument)를 사용한다.
          payload: rm.data['argument'],
        );
      }
    });

    // Background 상태. Notification 서랍에서 메시지 터치하여 앱으로 돌아왔을 때의 동작은 여기서.
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage rm) {
      Get.to(() => const NotificationDetailsPage(), arguments: rm.data['argument']);
    });

    // Terminated 상태에서 도착한 메시지에 대한 처리
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      Get.to(() => const NotificationDetailsPage(), arguments: initialMessage.data['argument']);
    }

    return true;
  }
}
