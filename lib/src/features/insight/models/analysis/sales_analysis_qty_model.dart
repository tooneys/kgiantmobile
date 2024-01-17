import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';

var numberFormat = NumberFormat("###,###,###");

class SalesAnalysisQtyModel {
  SalesAnalysisQtyModel(
    this.year,
    this.itemName,
    this.order,
    this.delivery,
    this.ret,
  );

  final String year;
  final String itemName;
  final int order;
  final int delivery;
  final int ret;

  static SalesAnalysisQtyModel empty() => SalesAnalysisQtyModel('', '', 0, 0, 0);

  factory SalesAnalysisQtyModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return SalesAnalysisQtyModel(data['year'].toString() ?? '', data['item'] ?? '', data['order'] ?? 0, data['delivery'] ?? 0, data['return'] ?? 0);
    } else {
      return SalesAnalysisQtyModel.empty();
    }
  }
}

class SalesQtyAnalysisDataSource extends DataGridSource {
  SalesQtyAnalysisDataSource({required List<SalesAnalysisQtyModel> listData}) {
    _data = listData
        .map((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'year', value: e.year),
              DataGridCell<String>(columnName: 'itemName', value: e.itemName),
              DataGridCell<int>(columnName: 'order', value: e.order),
              DataGridCell<int>(columnName: 'delivery', value: e.delivery),
              DataGridCell<int>(columnName: 'ret', value: e.ret),
            ]))
        .toList();
  }

  List<DataGridRow> _data = [];

  @override
  List<DataGridRow> get rows => _data;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
      return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(KSizes.spaceBtwItems),
        child: Text(e.value.toString()),
      );
    }).toList());
  }

  @override
  Widget? buildGroupCaptionCellWidget(RowColumnIndex rowColumnIndex, String summaryValue) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      child: Text(summaryValue),
    );
  }
}

class YearlyChartSumData {
  String year;
  int sum;

  YearlyChartSumData(this.year, this.sum);

  static YearlyChartSumData empty() {
    return YearlyChartSumData('', 0);
  }

  factory YearlyChartSumData.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return YearlyChartSumData(
        data['year'].toString(),
        data['order'] ?? 0,
      );
    } else {
      return YearlyChartSumData.empty();
    }
  }
}
