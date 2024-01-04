import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_amt_model.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_qty_model.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesSummaryController extends GetxController {
  static SalesSummaryController get instance => Get.find();

  List<GridColumn> yearlyColumn = <GridColumn>[];
  List<SalesAnalysisQtyModel> yearlyQty = <SalesAnalysisQtyModel>[];
  late SalesQtyAnalysisDataSource salesQtyAnalysisDataSource;
  List<SalesAnalysisAmtModel> yearlyAmt = <SalesAnalysisAmtModel>[];
  late SalesAmtAnalysisDataSource salesAmtAnalysisDataSource;

  // get Data
  getSalesAnlysisQty() {
    final random = Random();

    return [
      SalesAnalysisQtyModel('2021', '냉장고', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2021', '에어컨', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2021', '오븐', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2022', '냉장고', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2022', '에어컨', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2022', '오븐', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2023', '냉장고', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2023', '에어컨', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2023', '오븐', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2024', '냉장고', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2024', '에어컨', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
      SalesAnalysisQtyModel('2024', '오븐', random.nextInt(10000), random.nextInt(10000), random.nextInt(100)),
    ];
  }

  // get Data
  getSalesAnlysisAmt() {
    final random = Random();

    return [
      SalesAnalysisAmtModel('2021', '냉장고', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2021', '에어컨', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2021', '오븐', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2022', '냉장고', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2022', '에어컨', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2022', '오븐', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2023', '냉장고', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2023', '에어컨', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2023', '오븐', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2024', '냉장고', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2024', '에어컨', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
      SalesAnalysisAmtModel('2024', '오븐', random.nextInt(100000000), random.nextInt(100000000), random.nextInt(10000000)),
    ];
  }

  getSalesAnlysisColumn() {
    return <GridColumn>[
      GridColumn(
        columnName: 'year',
        label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(KSizes.spaceBtwInputFields),
          child: Text(
            '년도',
            style: Theme.of(Get.context!).textTheme.labelLarge!.apply(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'itemName',
        label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(KSizes.spaceBtwInputFields),
          child: Text(
            '품목',
            style: Theme.of(Get.context!).textTheme.labelLarge!.apply(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'order',
        label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(KSizes.spaceBtwInputFields),
          child: Text(
            '판매',
            style: Theme.of(Get.context!).textTheme.labelLarge!.apply(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'delivery',
        label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(KSizes.spaceBtwInputFields),
          child: Text(
            '출고',
            style: Theme.of(Get.context!).textTheme.labelLarge!.apply(color: Colors.white),
          ),
        ),
      ),
      GridColumn(
        columnName: 'ret',
        label: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(KSizes.spaceBtwInputFields),
          child: Text(
            '반품',
            style: Theme.of(Get.context!).textTheme.labelLarge!.apply(color: Colors.white),
          ),
        ),
      ),
    ];
  }

  @override
  void onInit() {
    salesQtySummary();
    salesAmtSummary();
    super.onInit();
  }

  void salesQtySummary() {
    yearlyQty = getSalesAnlysisQty();
    yearlyColumn = getSalesAnlysisColumn();

    salesQtyAnalysisDataSource = SalesQtyAnalysisDataSource(listData: yearlyQty);
    //그룹
    //salesQtyAnalysisDataSource.addColumnGroup(ColumnGroup(name: 'year', sortGroupRows: true));
  }

  void salesAmtSummary() {
    yearlyAmt = getSalesAnlysisAmt();
    yearlyColumn = getSalesAnlysisColumn();

    salesAmtAnalysisDataSource = SalesAmtAnalysisDataSource(listData: yearlyAmt);
    //그룹
    //salesAmtAnalysisDataSource.addColumnGroup(ColumnGroup(name: 'year', sortGroupRows: true));
  }
}
