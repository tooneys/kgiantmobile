import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/authentication/auth_repository.dart';
import 'package:kgiantmobile/src/exceptions/firebase_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/format_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/platform_exceptions.dart';
import 'package:kgiantmobile/src/features/authentication/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// fucntion to save user data to Firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[userRecord SaveError] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }
  }

  /// fucntion to fetch user details based on user ID
  Future<UserModel> fetchUserDetails() async {
    try {
      final docSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if (docSnapshot.exists) {
        return UserModel.fromSnapshot(docSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[userRecord FetchError] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }
  }

  /// fucntion to update user data in Firestore
  Future<void> updateUserDetails(UserModel userModel) async {
    try {
      await _db.collection("Users").doc(userModel.id).update(userModel.toJson());
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[userRecord update Error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }
  }

  /// Update any field in specific Users Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[userRecord update Error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }
  }

  /// Function to remove user data form fireStore
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      debugPrint(e.toString());
      throw '[userRecord delete Error] 문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }
  }
}
