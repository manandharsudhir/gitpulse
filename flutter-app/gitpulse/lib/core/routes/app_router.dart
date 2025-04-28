import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/features/auth/view/login_screen.dart';
import 'package:gitpulse/features/dashboard/view/dashboard_screen.dart';
import 'package:gitpulse/features/splashScreen/view/splash_screen.dart';
import '../widgets/error_screens/error_screen.dart';
import '../widgets/error_screens/nointernet_screen.dart';
import 'route_guards.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(
          page: SplashRoute.page,
          initial: true,
          // guards: [
          //   NetworkConnectionGuard(),
          // ],
        ),
        AutoRoute(
          path: "/login",
          page: LoginRoute.page,
        ),
        AutoRoute(
          path: "/dashboard",
          page: DashboardRoute.page,
        ),
      ];
}
