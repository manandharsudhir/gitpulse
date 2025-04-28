import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/features/dashboard/view/widget/dashboard_sidebar_widget.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DashboardSidebarWidget(),
          Container(),
        ],
      ),
    );
  }
}
