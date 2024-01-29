import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/sizes.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class SalesAnalysisAmtModel {
  SalesAnalysisAmtModel(
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

  static SalesAnalysisAmtModel empty() => SalesAnalysisAmtModel('', '', 0, 0, 0);

  factory SalesAnalysisAmtModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return SalesAnalysisAmtModel(
        data['year'].toString(),
        data['item'] ?? '',
        data['order'] ?? 0,
        data['delivery'] ?? 0,
        data['return'] ?? 0,
      );
    } else {
      return SalesAnalysisAmtModel.empty();
    }
  }
}

class SalesAmtAnalysisDataSource extends DataGridSource {
  SalesAmtAnalysisDataSource({required List<SalesAnalysisAmtModel> listData}) {
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
