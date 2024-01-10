import 'dart:math';

import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/insight/models/sales/mothly_summary_model.dart';

class MonthlySummaryController extends GetxController {
  static MonthlySummaryController get instance => Get.find();

  Random rand = Random();
  List<List<MonthlySummaryModel>> products = [];

  @override
  void onInit() {
    initialize();
    super.onInit();
  }

  void initialize() {
    products = [
      [
        MonthlySummaryModel(month: 'Jan', product: '휴대폰', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Feb', product: '휴대폰', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Mar', product: '휴대폰', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Apr', product: '휴대폰', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'May', product: '휴대폰', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
      ],
      [
        MonthlySummaryModel(month: 'Jan', product: '컴퓨터', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Feb', product: '컴퓨터', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Mar', product: '컴퓨터', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Apr', product: '컴퓨터', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'May', product: '컴퓨터', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
      ],
      [
        MonthlySummaryModel(month: 'Jan', product: '태블릿', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Feb', product: '태블릿', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Mar', product: '태블릿', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'Apr', product: '태블릿', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
        MonthlySummaryModel(month: 'May', product: '태블릿', qty: rand.nextInt(1000), amount: rand.nextInt(99999999)),
      ],
    ];
  }
}
