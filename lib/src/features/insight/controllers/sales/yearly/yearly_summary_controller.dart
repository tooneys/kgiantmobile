import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_amt_model.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_qty_model.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;

class SalesSummaryController extends GetxController {
  static SalesSummaryController get instance => Get.find();

  /// 그리드 컬럼
  List<GridColumn> yearlyColumn = <GridColumn>[];

  /// 수량 데이터
  List<charts.Series<yearlyChartSumData, String>> yearlyChartQty = [];
  List<SalesAnalysisQtyModel> yearlyQty = <SalesAnalysisQtyModel>[];
  late SalesQtyAnalysisDataSource salesQtyAnalysisDataSource;

  /// 금액 데이터
  List<SalesAnalysisAmtModel> yearlyAmt = <SalesAnalysisAmtModel>[];
  late SalesAmtAnalysisDataSource salesAmtAnalysisDataSource;

  /// 변수
  final fireStore = FirebaseFirestore.instance;

  // get chart Data
  Future<List<charts.Series<yearlyChartSumData, String>>> getChartData() async {
    final query = await fireStore.collection('yearly_items_quantity').orderBy('year').get();

    Map<String, int> chartDataMap = {};

    query.docs.forEach((e) {
      //print("${e.data()['year']} : ${e.data()['order']}");
      chartDataMap.update(e.data()['year'].toString(), (value) => value + (e.data()['order']) as int,
          ifAbsent: () => (e.data()['order']) as int);
    });

    List<yearlyChartSumData> chartData = chartDataMap.entries
        .map((entry) => yearlyChartSumData(
              year: entry.key,
              sum: entry.value,
            ))
        .toList();

    final chartSeries = chartData.map((data) {
      return charts.Series<yearlyChartSumData, String>(
        id: 'yearly',
        domainFn: (yearlyChartSumData sales, _) => sales.year,
        measureFn: (yearlyChartSumData sales, _) => sales.sum,
        data: [data],
        displayName: '판매량',
      );
    }).toList();

    return chartSeries;
  }

  // get grid Data
  Future<List<SalesAnalysisQtyModel>> getSalesAnalysisQty() async {
    final query = await fireStore.collection('yearly_items_quantity').orderBy('year').orderBy('item').get();

    List<SalesAnalysisQtyModel> result = query.docs.map((doc) => SalesAnalysisQtyModel.fromSnapshot(doc)).toList();
    return result;
  }

  // get Data
  Future<List<SalesAnalysisAmtModel>> getSalesAnalysisAmt() async {
    final query = await fireStore.collection('yearly_items_amount').orderBy('year').orderBy('item').get();
    List<SalesAnalysisAmtModel> result = query.docs.map((doc) => SalesAnalysisAmtModel.fromSnapshot(doc)).toList();
    return result;
  }

  getSalesAnalysisColumn() {
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

  Future<void> salesQtySummary() async {
    yearlyChartQty = await getChartData();
    yearlyQty = await getSalesAnalysisQty();
    yearlyColumn = getSalesAnalysisColumn();

    salesQtyAnalysisDataSource = SalesQtyAnalysisDataSource(listData: yearlyQty);
    //그룹
    //salesQtyAnalysisDataSource.addColumnGroup(ColumnGroup(name: 'year', sortGroupRows: true));
  }

  Future<void> salesAmtSummary() async {
    yearlyAmt = await getSalesAnalysisAmt();
    yearlyColumn = getSalesAnalysisColumn();

    salesAmtAnalysisDataSource = SalesAmtAnalysisDataSource(listData: yearlyAmt);
    //그룹
    //salesAmtAnalysisDataSource.addColumnGroup(ColumnGroup(name: 'year', sortGroupRows: true));
  }
}

class yearlyChartSumData {
  String year;
  int sum;

  yearlyChartSumData({required this.year, required this.sum});
}
