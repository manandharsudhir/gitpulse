import 'package:flutter/material.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:gitpulse/core/configs/style/theme.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:toastification/toastification.dart';
import 'core/constants/string_constants.dart';
import 'core/routes/app_router.dart';

final appRouter = AppRouter();

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      // routerDelegate: appRouter.delegate(),
      routerConfig: appRouter.config(),
      // routeInformationParser: appRouter.defaultRouteParser(),
      title: AppStrings.appname,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: FormBuilderLocalizations.supportedLocales,
      theme: AppTheme.defaultTheme,
      builder: (context, widget) {
        widget = ResponsiveBreakpoints.builder(
          child: widget!,
          breakpoints: const [
            Breakpoint(start: 0, end: 450, name: MOBILE),
            Breakpoint(start: 451, end: 800, name: TABLET),
            Breakpoint(start: 801, end: 1920, name: DESKTOP),
            Breakpoint(start: 1921, end: double.infinity, name: '4K'),
          ],
        );
        return ToastificationWrapper(
            child: MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: widget,
        ));
      },
    );
  }
}
