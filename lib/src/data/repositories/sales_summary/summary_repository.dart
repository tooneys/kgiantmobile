import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/exceptions/firebase_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/format_exceptions.dart';
import 'package:kgiantmobile/src/exceptions/platform_exceptions.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_amt_model.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_qty_model.dart';

class SummaryRepository extends GetxController {
  static SummaryRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  Future<List<SalesAnalysisQtyModel>> getAllYearlyItemsQty() async {
    try {
      final snapshot = await _db.collection('yearly_items_quantity').orderBy('year').orderBy('item').get();
      final list = snapshot.docs.map((document) => SalesAnalysisQtyModel.fromSnapshot(document)).toList();
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

  Future<List<SalesAnalysisAmtModel>> getAllYearlyItemsAmt() async {
    try {
      final snapshot = await _db.collection('yearly_items_amount').orderBy('year').orderBy('item').get();
      final list = snapshot.docs.map((document) => SalesAnalysisAmtModel.fromSnapshot(document)).toList();
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
