import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/features/dashboard/view/widget/dashboard_table_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DashboardMainView extends StatelessWidget {
  const DashboardMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("Dashboard"),
            CircleAvatar(),
          ],
        ),
        Expanded(child: DashboardTableWidget())
      ],
    );
  }
}
