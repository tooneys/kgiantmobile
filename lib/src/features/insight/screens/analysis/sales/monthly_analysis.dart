import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/charts/syncfusion_bar_chart.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class MonthlyAnalysisScreen extends StatelessWidget {
  const MonthlyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SyncfusionBarChart(title: '최근 주요품목 판매수량 집계'),
              const SizedBox(height: KSizes.spaceBtwSections),
              const Divider(),
              SyncfusionBarChart(title: '최근 주요품목 판매금액 집계'),
              const SizedBox(height: KSizes.spaceBtwSections),
              const Divider(),
              SyncfusionBarChart(title: '최근 최다판매품목 수량 집계'),
              const SizedBox(height: KSizes.spaceBtwSections),
              const Divider(),
              SyncfusionBarChart(title: '최근 최다판매품목 금액 집계'),
            ],
          ),
        ),
      ),
    );
  }
}
