import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/routes/app_router.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';
import 'package:gitpulse/core/widgets/image_builder/image_builder.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';

import '../../../core/widgets/logo_container.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 53),
          child: LogoContainer(),
        ),
        leadingWidth: 200,
        toolbarHeight: 80,
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgImageBuilder(
                svgPath: Assets.logo.webpoint,
                height: 26,
                width: 36,
              ),
              Text(
                "Log in to your account",
                style: AppTextStyle.headingh3,
              ),
              Text(
                "Welcome back! Please enter your details.",
                style: AppTextStyle.bodyb1,
              ),
              Spacing.sizedBoxH_32(),
              FormFieldWidget(
                name: "email",
                labelText: "Email",
              ),
              Spacing.sizedBoxH_08(),
              FormFieldWidget(
                name: "password",
                labelText: "Password",
              ),
              Spacing.sizedBoxH_16(),
              CustomButton(
                text: "Sign in",
                onPressed: () {
                  context.pushRoute(DashboardRoute());
                },
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
