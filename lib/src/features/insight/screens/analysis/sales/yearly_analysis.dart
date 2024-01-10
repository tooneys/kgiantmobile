import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/charts/grouped_bar_chart.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/features/insight/controllers/sales/yearly/yearly_summary_controller.dart';
import 'package:kgiantmobile/src/features/insight/screens/analysis/sales/analysis_grid.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class YearlyAnalysisScreen extends StatelessWidget {
  const YearlyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SalesSummaryController());

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
              KSectionHeading(
                title: '수량 집계',
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
              Expanded(child: GroupedBarChart.withRandomData()),
              const SizedBox(height: KSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: KSizes.spaceBtwItems),
              KSectionHeading(
                title: '금액 집계',
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
              Expanded(child: GroupedBarChart.withRandomData2()),
            ],
          ),
        ),
      ),
    );
  }
}
