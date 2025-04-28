import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:github/github.dart';
import 'package:gitpulse/core/configs/spacing_size.dart';
import 'package:gitpulse/core/configs/style/text_styles.dart';
import 'package:gitpulse/core/constants/assets.gen.dart';
import 'package:gitpulse/core/routes/app_router.dart';
import 'package:gitpulse/core/widgets/button/button_type.dart';
import 'package:gitpulse/core/widgets/button/custom_button.dart';
import 'package:gitpulse/core/widgets/form_widget/form_field_widget.dart';
import 'package:gitpulse/core/widgets/image_builder/image_builder.dart';
import 'package:gitpulse/core/widgets/image_builder/svg_image_builder.dart';
import 'package:gitpulse/core/widgets/loading_widget/progress_indicator_widget.dart';
import 'package:gitpulse/core/widgets/toast/toast.dart';
import 'package:gitpulse/features/auth/provider/auth_provider.dart';

import '../../../core/widgets/logo_container.dart';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/constants/string_constants.dart';
import 'package:loading_overlay/loading_overlay.dart';
import '../../../../core/models/response/response_status.dart';

@RoutePage()
class LoginScreen extends HookConsumerWidget {
  LoginScreen({super.key});
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final emailCon = useTextEditingController();
    final passwordCon = useTextEditingController();

    ref.listen(loginProvider, (prev, next) {
      next.maybeWhen(
          orElse: () {},
          success: (data) {
            context.router.replaceAll([const DashboardRoute()]);
          },
          error: (error) {
            showErrorToast("Login Failed");
          });
    });

    return LoadingOverlay(
      isLoading: loginState is ResponseStatusProgress,
      progressIndicator: ProgressIndicatorWidget(),
      opacity: 0.8,
      child: Scaffold(
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
            width: 360,
            child: Form(
              key: _formKey,
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
                  Spacing.sizedBoxH_08(),
                  Text(
                    "Welcome back! Please enter your details.",
                    style: AppTextStyle.bodyb1,
                  ),
                  Spacing.sizedBoxH_32(),
                  FormFieldWidget(
                    name: "email",
                    labelText: "Email",
                    controller: emailCon,
                  ),
                  Spacing.sizedBoxH_10(),
                  FormFieldWidget(
                    name: "password",
                    labelText: "Password",
                    controller: passwordCon,
                  ),
                  Spacing.sizedBoxH_24(),
                  CustomButton(
                    text: "Sign in",
                    onPressed: () {
                      ref.read(loginProvider.notifier).loginUser(
                          email: emailCon.text.trim(),
                          password: passwordCon.text.trim());
                    },
                  ),
                  Spacing.sizedBoxH_16(),
                  CustomButton(
                    text: "Sign in with Google",
                    buttonVariant: ButtonVariant.secondary,
                  ),
                  Spacing.sizedBoxH_16(),
                  CustomButton(
                    text: "Sign in with GitHub",
                    bgColor: Colors.black87,
                    prefixIcon: Assets.images.imgGithub.path,
                    prefixSize: 30,
                    sizeBetweenPrefixAndText: 12,
                    onPressed: () async {
                      ref.read(loginProvider.notifier).loginUsingGithub();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
