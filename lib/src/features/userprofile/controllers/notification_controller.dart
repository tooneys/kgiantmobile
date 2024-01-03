import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  final localStorage = GetStorage();
  final countNotification = 0.obs;
  late List<dynamic>? listNotification = [];

  Future<void> saveStorage(Map<String, dynamic> data) async {
    try {
      String notificationJson = jsonEncode(data);
      listNotification!.add(notificationJson);

      /// 로컬스토리지에 리스트 저장
      await localStorage.write('notifications', listNotification);

      countNotification.value = listNotification!.length;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> clearStorage() async {
    await localStorage.remove('notifications');
    countNotification.value = listNotification!.length;
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
    if (localStorage.read('notifications') != null) {
      listNotification?.add(localStorage.read('notifications'));
      countNotification.value = listNotification!.length;
    }
  }
}
