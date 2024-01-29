import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

// ignore: must_be_immutable
class KSfCatesianChart extends StatelessWidget {
  KSfCatesianChart({
    super.key,
    required this.title,
    this.height = KSizes.chartSize,
    required this.series,
    this.isLegendVisible = true,
  });

  final String title;
  final double height;
  List<LineSeries<dynamic, String>> series;
  final bool isLegendVisible;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        title: ChartTitle(text: title),
        legend: Legend(isVisible: isLegendVisible),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: series,
      ),
    );
  }
}
