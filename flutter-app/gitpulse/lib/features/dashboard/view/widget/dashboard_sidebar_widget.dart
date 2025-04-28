import 'package:flutter/material.dart';
import 'package:gitpulse/core/widgets/logo_container.dart';

class DashboardSidebarWidget extends StatelessWidget {
  const DashboardSidebarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          LogoContainer(),
        ],
      ),
    );
  }
}
