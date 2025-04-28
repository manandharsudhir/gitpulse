import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gitpulse/core/configs/style/colors.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/routes/app_router.dart';

@RoutePage()
class SplashScreen extends HookConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useMemoized(() {
      Future.delayed(Duration(seconds: 2), () {
        context.pushRoute(LoginRoute());
      });
    });

    // ref.listen(
    //   authStatusProvider,
    //   (prev, next) {
    //     next.maybeWhen(
    //       orElse: () {},
    //       guest: () {
    //         context.router.replaceAll([LoginRoute()]);
    //       },
    //       loggedIn: () {
    //         context.router.replaceAll([DashboardRoute()]);
    //       },
    //     );
    //   },
    // );

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(bottom: 40),
        child: SvgImageBuilder(svgPath: Assets.logo.webpointLarge),
      ),
    );
  }
}
