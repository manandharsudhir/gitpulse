import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgImageBuilder(
          svgPath: Assets.logo.webpointLarge,
        ),
      ),
      body: Center(
        child: Container(
          width: 500,
          child: Column(
            children: [
              Text(
                "Log in to your account",
                style: AppTextStyle.headingh3,
              ),
              Text(
                "Log in to your account",
                style: AppTextStyle.bodyb1,
              ),
              FormFieldWidget(name: "email"),
              Spacing.sizedBoxH_08(),
              FormFieldWidget(name: "password"),
              Spacing.sizedBoxH_16(),
              CustomButton(
                text: "Sign in",
              ),
              Spacing.sizedBoxH_16(),
              CustomButton(
                text: "Sign in",
                buttonVariant: ButtonVariant.secondary,
              ),
              Spacing.sizedBoxH_16(),
              CustomButton(
                text: "Sign in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
