import 'package:flutter/material.dart';
import 'package:kgiantmobile/src/common/widgets/appbar/appbar.dart';
import 'package:kgiantmobile/src/common/widgets/datagrid/datagrid.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AnalysisGridScreen extends StatelessWidget {
  const AnalysisGridScreen({
    super.key,
    required this.title,
    required this.dataSource,
    required this.columns,
  });

  final String title;
  final DataGridSource dataSource;
  final List<GridColumn> columns;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: KAppBar(
          title: Text(title),
          showBackArrow: true,
        ),
        body: DataGridScreen(
          source: dataSource,
          columns: columns,
        ),
      ),
    );
  }
}
