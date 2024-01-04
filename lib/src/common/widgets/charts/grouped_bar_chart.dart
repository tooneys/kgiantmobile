// Copyright 2018 the Charts project authors. Please see the AUTHORS file
// for details.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Bar chart example
library;

// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';
// EXCLUDE_FROM_GALLERY_DOCS_END
import 'package:flutter/material.dart';
import 'package:community_charts_flutter/community_charts_flutter.dart' as charts;

class GroupedBarChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  const GroupedBarChart(this.seriesList, {super.key, this.animate = false});

  factory GroupedBarChart.withSampleData() {
    return GroupedBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory GroupedBarChart.withRandomData() {
    return GroupedBarChart(
      _createRandomData(),
      animate: true,
    );
  }

  factory GroupedBarChart.withRandomData2() {
    return GroupedBarChart(
      _createRandomData2(),
      animate: true,
    );
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = Random();

    final desktopSalesData = [
      OrdinalSales('2021', random.nextInt(10000)),
      OrdinalSales('2022', random.nextInt(10000)),
      OrdinalSales('2023', random.nextInt(10000)),
      OrdinalSales('2024', random.nextInt(10000)),
    ];

    final tableSalesData = [
      OrdinalSales('2021', random.nextInt(10000)),
      OrdinalSales('2022', random.nextInt(10000)),
      OrdinalSales('2023', random.nextInt(10000)),
      OrdinalSales('2024', random.nextInt(10000)),
    ];

    final mobileSalesData = [
      OrdinalSales('2021', random.nextInt(10000)),
      OrdinalSales('2022', random.nextInt(10000)),
      OrdinalSales('2023', random.nextInt(10000)),
      OrdinalSales('2024', random.nextInt(10000)),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        displayName: '컴퓨터',
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        displayName: '태블릿',
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        displayName: '핸드폰',
      ),
    ];
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData2() {
    final random = Random();

    final desktopSalesData = [
      OrdinalSales('2021', random.nextInt(999999999)),
      OrdinalSales('2022', random.nextInt(999999999)),
      OrdinalSales('2023', random.nextInt(999999999)),
      OrdinalSales('2024', random.nextInt(999999999)),
    ];

    final tableSalesData = [
      OrdinalSales('2021', random.nextInt(999999999)),
      OrdinalSales('2022', random.nextInt(999999999)),
      OrdinalSales('2023', random.nextInt(999999999)),
      OrdinalSales('2024', random.nextInt(999999999)),
    ];

    final mobileSalesData = [
      OrdinalSales('2021', random.nextInt(999999999)),
      OrdinalSales('2022', random.nextInt(999999999)),
      OrdinalSales('2023', random.nextInt(999999999)),
      OrdinalSales('2024', random.nextInt(999999999)),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.grouped,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      OrdinalSales('2021', 5),
      OrdinalSales('2022', 25),
      OrdinalSales('2023', 100),
      OrdinalSales('2024', 75),
    ];

    final tableSalesData = [
      OrdinalSales('2021', 25),
      OrdinalSales('2022', 50),
      OrdinalSales('2023', 10),
      OrdinalSales('2024', 20),
    ];

    final mobileSalesData = [
      OrdinalSales('2021', 10),
      OrdinalSales('2022', 15),
      OrdinalSales('2023', 50),
      OrdinalSales('2024', 45),
    ];

    return [
      charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
