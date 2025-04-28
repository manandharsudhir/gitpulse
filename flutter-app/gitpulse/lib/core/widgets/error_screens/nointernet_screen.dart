import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

import '../../configs/spacing_size.dart';
import '../../configs/style/text_styles.dart';
import '../../services/network/network_connection.dart';
import '../button/custom_button.dart';

@RoutePage()
class NoInternetScreen extends HookConsumerWidget {
  final void Function(bool hasConnection)? onConnection;
  const NoInternetScreen({super.key, required this.onConnection});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgImageBuilder(
            svgPath: Assets.images.nointernet,
            height: 127,
            width: 127,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              children: [
                const Text(
                  "No Internet Connection",
                  style: AppTextStyle.subtitleS1,
                  textAlign: TextAlign.center,
                ),
                Spacing.sizedBoxH_08(),
                const Text(
                  "Please check your internet connection and refresh",
                  textAlign: TextAlign.center,
                  style: AppTextStyle.bodyb2,
                ),
                Spacing.sizedBoxH_16(),
                CustomButton(
                    text: "Refresh",
                    buttonVariant: ButtonVariant.primary,
                    onPressed: () async {
                      final connection =
                          await NetworkConnectionCheck.checkConnection();
                      // onConnection?.call(connection);
                      if (onConnection != null) {
                        onConnection!(connection);
                      }
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
