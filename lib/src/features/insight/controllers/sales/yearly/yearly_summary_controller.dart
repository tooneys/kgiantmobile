import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/sales_summary/summary_repository.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_amt_model.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_qty_model.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesSummaryController extends GetxController {
  static SalesSummaryController get instance => Get.find();

  @override
  void onReady() async {
    /// grid
    getSalesAnalysisColumn();

    /// get data
    await getGridQtyData();
    await getGridAmtData();

    /// chart
    yearlyChartData = await getChartData();

    super.onReady();
  }

  final analysisRepository = Get.put(SummaryRepository());

  /// 차트 데이터
  List<YearlyChartSumData> yearlyChartData = [];

  /// 그리드 컬럼
  List<GridColumn> yearlyColumn = <GridColumn>[];
  List<SalesAnalysisQtyModel> salesAnalysisQtyModel = <SalesAnalysisQtyModel>[];
  List<SalesAnalysisAmtModel> salesAnalysisAmtModel = <SalesAnalysisAmtModel>[];

  getGridQtyData() async {
    salesAnalysisQtyModel = await analysisRepository.getAllYearlyItemsQty();
  }

  getGridAmtData() async {
    salesAnalysisAmtModel = await analysisRepository.getAllYearlyItemsAmt();
  }

  Future<List<YearlyChartSumData>> getChartData() async {
    Map<String, int> chartDataMap = {};
    for (var e in salesAnalysisQtyModel) {
      chartDataMap.update(e.year, (value) => value + e.order, ifAbsent: () => e.order);
    }

    return Future<List<YearlyChartSumData>>.value(
        chartDataMap.entries.map((entry) => YearlyChartSumData(entry.key, entry.value)).toList());
  }

  get salesQtyAnalysisDataSource => SalesQtyAnalysisDataSource(listData: salesAnalysisQtyModel);

  get salesAmtAnalysisDataSource => SalesAmtAnalysisDataSource(listData: salesAnalysisAmtModel);

  getSalesAnalysisColumn() {
    yearlyColumn = <GridColumn>[
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
}
