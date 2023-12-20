import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/exceptions/firebase_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/format_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/platform_exceptions.dart';
import 'package:kgiantmobile/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch(e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[userRecord SaveError] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }


  }


}