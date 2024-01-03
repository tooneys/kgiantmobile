import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/exceptions/firebase_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/format_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/platform_exceptions.dart';
import 'package:kgiantmobile/src/features/insight/models/category_model.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();
      return list;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const KFormatException();
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    } catch (e) {
      throw '문제가 발생하였습니다. 잠시후 다시 시도하여 주십시오!';
    }
  }
}
