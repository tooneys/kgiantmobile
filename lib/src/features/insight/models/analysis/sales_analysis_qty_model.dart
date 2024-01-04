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
