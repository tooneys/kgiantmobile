import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/charts/syncfusion_bar_chart.dart';
import 'package:kgiantmobile/src/features/insight/controllers/sales/monthly/mothly_summary_controller.dart';
import 'package:kgiantmobile/src/features/insight/models/sales/mothly_summary_model.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MonthlyAnalysisScreen extends StatelessWidget {
  const MonthlyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MonthlySummaryController());

    return SafeArea(
      child: Scaffold(
        appBar: const KAppBar(
          title: Text('월별 판매 분석'),
          showBackArrow: true,
          actions: [],
        ),
        body: Padding(
          padding: const EdgeInsets.all(KSizes.defaultSpace),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// 주요품목 수량
                KSfCatesianChart(
                  title: '최근 주요품목 판매수량 집계',
                  series: controller.products.map((product) {
                    return LineSeries<MonthlySummaryModel, String>(
                      dataSource: product,
                      xValueMapper: (MonthlySummaryModel sales, _) => sales.month,
                      yValueMapper: (MonthlySummaryModel sales, _) => sales.qty,
                      name: product[0].product,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    );
                  }).toList(),
                ),
                const SizedBox(height: KSizes.spaceBtwSections),
                const Divider(),

                /// 주요품목 금액
                KSfCatesianChart(
                  title: '최근 주요품목 판매금액 집계',
                  series: controller.products.map((product) {
                    return LineSeries<MonthlySummaryModel, String>(
                      dataSource: product,
                      xValueMapper: (MonthlySummaryModel sales, _) => sales.month,
                      yValueMapper: (MonthlySummaryModel sales, _) => sales.amount,
                      name: product[0].product,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    );
                  }).toList(),
                ),
                const SizedBox(height: KSizes.spaceBtwSections),
                const Divider(),

                /// 최근 최다판매 수량
                KSfCatesianChart(
                  title: '최근 최다판매품목 수량 집계',
                  series: controller.products.map((product) {
                    return LineSeries<MonthlySummaryModel, String>(
                      dataSource: product,
                      xValueMapper: (MonthlySummaryModel sales, _) => sales.month,
                      yValueMapper: (MonthlySummaryModel sales, _) => sales.qty,
                      name: product[0].product,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    );
                  }).toList(),
                ),
                const SizedBox(height: KSizes.spaceBtwSections),
                const Divider(),

                /// 최근 최다판매 금액
                KSfCatesianChart(
                  title: '최근 최다판매품목 금액 집계',
                  series: controller.products.map((product) {
                    return LineSeries<MonthlySummaryModel, String>(
                      dataSource: product,
                      xValueMapper: (MonthlySummaryModel sales, _) => sales.month,
                      yValueMapper: (MonthlySummaryModel sales, _) => sales.amount,
                      name: product[0].product,
                      dataLabelSettings: const DataLabelSettings(isVisible: true),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
