import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/features/dashboard/view/dashboard_main_view.dart';
import 'package:gitpulse/features/dashboard/view/widget/dashboard_sidebar_widget.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 1, child: DashboardSidebarWidget()),
          Expanded(
            flex: 5,
            child: DashboardMainView(),
          ),
        ],
      ),
    );
  }
}
