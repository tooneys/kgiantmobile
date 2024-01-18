import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/data/repositories/sales_summary/summary_repository.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_amt_model.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_qty_model.dart';
import 'package:kgiantmobile/src/utils/constants/image_strings.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:kgiantmobile/src/utils/network_manager/network_manager.dart';
import 'package:kgiantmobile/src/utils/popups/full_screen_loader.dart';
import 'package:kgiantmobile/src/utils/popups/loaders.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesSummaryController extends GetxController {
  static SalesSummaryController get instance => Get.find();

  @override
  void onInit() async {
    super.onInit();

    /// get data
    await getGridQtyData();
    await getGridAmtData();

    /// chart
    await getChartData();

    /// grid
    getSalesAnalysisColumn();
  }

  final analysisRepository = Get.put(SummaryRepository());

  /// 차트 데이터
  RxList<YearlyChartSumData> yearlyChartData = <YearlyChartSumData>[].obs;

  /// 그리드 컬럼
  List<GridColumn> yearlyColumn = <GridColumn>[];
  List<SalesAnalysisQtyModel> salesAnalysisQtyModel = [];
  List<SalesAnalysisAmtModel> salesAnalysisAmtModel = [];

  Future<void> getGridQtyData() async => salesAnalysisQtyModel = await analysisRepository.getAllYearlyItemsQty();
  Future<void> getGridAmtData() async => salesAnalysisAmtModel = await analysisRepository.getAllYearlyItemsAmt();

  Future<void> getChartData() async {
    try {
      KFullScreenLoader.openLoadingDialog('처리중...', KImage.loadingAnimation);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoader.stopLoading();
        return;
      }

      Map<String, int> chartDataMap = {};
      for (var e in salesAnalysisQtyModel) {
        chartDataMap.update(e.year, (value) => value + e.order, ifAbsent: () => e.order);
      }

      yearlyChartData.assignAll(chartDataMap.entries.map((entry) => YearlyChartSumData(entry.key, entry.value)).toList());

      KFullScreenLoader.stopLoading();
      //KLoaders.successSnackBar(title: 'Success', message: '집계 데이터를 가져왔습니다.!');
    } catch (e) {
      KFullScreenLoader.stopLoading();
      KLoaders.errorSnackBar(title: 'Error', message: e.toString());
    }
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
