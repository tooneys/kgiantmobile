import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SyncfusionBarChart extends StatelessWidget {
  SyncfusionBarChart({
    super.key,
    required this.title,
    this.height = KSizes.chartSize,
  });

  final String title;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: SfCartesianChart(
        primaryXAxis: const CategoryAxis(),
        title: ChartTitle(text: title),
        legend: const Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries<_SalesData, String>>[
          LineSeries<_SalesData, String>(
            dataSource: data,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            name: 'Sales',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
          LineSeries<_SalesData, String>(
            dataSource: data2,
            xValueMapper: (_SalesData sales, _) => sales.year,
            yValueMapper: (_SalesData sales, _) => sales.sales,
            name: 'Sales2',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }

  List<_SalesData> data = [_SalesData('Jan', 35), _SalesData('Feb', 28), _SalesData('Mar', 34), _SalesData('Apr', 32), _SalesData('May', 40)];
  List<_SalesData> data2 = [_SalesData('Jan', 45), _SalesData('Feb', 38), _SalesData('Mar', 14), _SalesData('Apr', 22), _SalesData('May', 80)];
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}
