import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/charts/grouped_bar_chart.dart';
import 'package:kgiantmobile/src/common/widgets/texts/section_heading.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';

class DailyAnalysisScreen extends StatelessWidget {
  const DailyAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const KAppBar(
        title: Text('일별 판매 분석'),
        showBackArrow: true,
        actions: [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(KSizes.defaultSpace),
        child: Column(
          children: [
            KSectionHeading(title: '수량 집계', onPressed: () {}, showActionButton: false),
            const SizedBox(height: KSizes.spaceBtwItems),
            Expanded(child: GroupedBarChart.withRandomData()),
            const SizedBox(height: KSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: KSizes.spaceBtwItems),
            KSectionHeading(title: '금액 집계', onPressed: () {}, showActionButton: false),
            const SizedBox(height: KSizes.spaceBtwItems),
            Expanded(child: GroupedBarChart.withRandomData()),
          ],
        ),
      ),
    );
  }
}
