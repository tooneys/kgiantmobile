import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kgiantmobile/src/features/firebasemessaging/models/notification_model.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final localStorage = GetStorage();
  final countNotification = 0.obs;
  RxList<dynamic> listNotification = [].obs;

  Future<void> saveStorage(Map<String, dynamic> data) async {
    try {
      //final notificationJson = jsonEncode(data);
      //print('saveStorage : $data');
      final notificationJson = NotificationModel(
        title: data["title"] ?? '',
        body: data["body"] ?? '',
        payload: data["payload"] ?? '',
      ).toJson();

      listNotification.add(notificationJson);

      /// 로컬스토리지에 리스트 저장
      await localStorage.write('notifications', listNotification);

      countNotification.value = listNotification!.length;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearStorage() async {
    await localStorage.remove('notifications');
    listNotification.clear();
    countNotification.value = 0;
  }

  List<dynamic> readStorage() {
    try {
      return localStorage.read('notifications');
    } catch (e) {
      return [];
    }
  }

  @override
  void onInit() {
    storageInit();
    super.onInit();
  }

  void storageInit() {
    listNotification.value = readStorage();
    countNotification.value = listNotification.length;
  }
}
