import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/features/insight/models/sales/mothly_summary_model.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class KSfCatesianChart extends StatelessWidget {
  KSfCatesianChart({
    super.key,
    required this.title,
    this.height = KSizes.chartSize,
    required this.series,
  });

  final String title;
  final double height;
  List<CartesianSeries<MonthlySummaryModel, String>> series;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        title: ChartTitle(text: title),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: series,
      ),
    );
  }
}
