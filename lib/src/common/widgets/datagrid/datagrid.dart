import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/utils/constants/colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class DataGridScreen extends StatelessWidget {
  const DataGridScreen({
    super.key,
    required this.source,
    required this.columns,
  });

  final DataGridSource source;
  final List<GridColumn> columns;

  @override
  Widget build(BuildContext context) {
    return SfTheme(
      data: SfThemeData(
        dataGridThemeData: SfDataGridThemeData(headerColor: KColors.primary),
      ),
      child: SfDataGrid(
        source: source,
        allowExpandCollapseGroup: true,
        columnWidthMode: ColumnWidthMode.fill,
        columns: columns,
      ),
    );
  }
}
