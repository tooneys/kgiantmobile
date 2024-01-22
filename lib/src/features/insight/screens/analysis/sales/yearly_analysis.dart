import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/charts/syncfusion_bar_chart.dart';
import 'package:kgiantmobile/src/common/widgets/shimmer/shimmer.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/features/insight/controllers/sales/monthly/mothly_summary_controller.dart';
import 'package:kgiantmobile/src/features/insight/controllers/sales/yearly/yearly_summary_controller.dart';
import 'package:kgiantmobile/src/features/insight/models/analysis/sales_analysis_qty_model.dart';
import 'package:kgiantmobile/src/features/insight/models/sales/mothly_summary_model.dart';
import 'package:kgiantmobile/src/features/insight/screens/analysis/sales/analysis_grid.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class YearlyAnalysisScreen extends StatelessWidget {
  YearlyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalesSummaryController());
    final mController = Get.put(MonthlySummaryController());

    return SafeArea(
      child: Scaffold(
        appBar: const KAppBar(
          title: Text('연간 판매 분석'),
          showBackArrow: true,
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: Column(
            children: [
              /// 수량집계 그래프 및 그리드
              KSectionHeading(
                title: '총 판매수량 집계',
                onPressed: () => Get.to(
                  () => AnalysisGridScreen(
                    title: '연간 판매 분석 (수량집계)',
                    dataSource: controller.salesQtyAnalysisDataSource,
                    columns: controller.yearlyColumn,
                  ),
                ),
                showActionButton: true,
                buttonTitle: '집계현황',
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              Obx(
                () {
                  List<YearlyChartSumData> dataSource = controller.yearlyChartData.value;

                  if (dataSource.isEmpty) {
                    return const KShimmerEffect(
                      width: double.infinity,
                      height: KSizes.chartSize,
                    );
                  }

                  return KSfCatesianChart(
                    series: [
                      LineSeries<YearlyChartSumData, String>(
                        enableTooltip: true,
                        dataSource: dataSource,
                        xValueMapper: (YearlyChartSumData value, _) => value.year.toString(),
                        yValueMapper: (YearlyChartSumData value, _) => value.sum,
                        dataLabelSettings: const DataLabelSettings(isVisible: true),
                      ),
                    ],
                    title: '',
                    isLegendVisible: false,
                  );
                },
              ),

              /// 경계선
              const SizedBox(height: KSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),

              /// 금액집계 그래프 및 그리드
              KSectionHeading(
                title: '총 판매금액 집계',
                onPressed: () => Get.to(
                  () => AnalysisGridScreen(
                    title: '연간 판매 분석 (금액집계)',
                    dataSource: controller.salesAmtAnalysisDataSource,
                    columns: controller.yearlyColumn,
                  ),
                ),
                showActionButton: true,
                buttonTitle: '집계현황',
              ),
              const SizedBox(height: KSizes.spaceBtwItems),
              KSfCatesianChart(
                series: mController.products.map((product) {
                  return LineSeries<MonthlySummaryModel, String>(
                    dataSource: product,
                    xValueMapper: (MonthlySummaryModel sales, _) => sales.month,
                    yValueMapper: (MonthlySummaryModel sales, _) => sales.qty,
                    name: product[0].product,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                  );
                }).toList(),
                title: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
