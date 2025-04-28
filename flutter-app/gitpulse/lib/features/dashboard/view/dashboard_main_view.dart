import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/features/dashboard/view/widget/dashboard_header_widget.dart';
import 'package:gitpulse/features/dashboard/view/widget/dashboard_project_widget.dart';
import 'package:gitpulse/features/dashboard/view/widget/dashboard_table_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class DashboardMainView extends StatelessWidget {
  const DashboardMainView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      DashboardHeaderWidget(),
                      SizedBox(
                        height: 43,
                      ),
                      Row(
                        spacing: 24,
                        children: [
                          Container(
                            width: 338,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Palette.lineDark,
                                )),
                            child: Column(
                              spacing: 24,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monthly',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '20/160hrs',
                                  style: TextStyle(
                                    fontSize: 36,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 338,
                            padding: EdgeInsets.all(24),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Palette.lineDark,
                                )),
                            child: Column(
                              spacing: 24,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Weekly',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '20/160hrs',
                                  style: TextStyle(
                                    fontSize: 36,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(24),
                            width: 338,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(color: Palette.lineDark)),
                            child: Column(
                              spacing: 24,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Daily',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '20/160hrs',
                                  style: TextStyle(
                                    fontSize: 36,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        Spacing.sizedBoxH_24(),
        Expanded(
          child: Column(
            children: [
              DashboardProjectWidget(),
              // DashboardTableWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
