// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [DashboardScreen]
class DashboardRoute extends PageRouteInfo<void> {
  const DashboardRoute({List<PageRouteInfo>? children})
    : super(DashboardRoute.name, initialChildren: children);

  static const String name = 'DashboardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const DashboardScreen();
    },
  );
}

/// generated route for
/// [ErrorScreen]
class ErrorRoute extends PageRouteInfo<ErrorRouteArgs> {
  ErrorRoute({
    Key? key,
    required VoidCallback function,
    bool showRefresh = true,
    String imgString = "assets/icons/error.svg",
    String subtitle = "Try refreshing",
    String title = "Something wrong occured",
    Widget? imgWidget,
    String btnString = "Refresh",
    List<PageRouteInfo>? children,
  }) : super(
         ErrorRoute.name,
         args: ErrorRouteArgs(
           key: key,
           function: function,
           showRefresh: showRefresh,
           imgString: imgString,
           subtitle: subtitle,
           title: title,
           imgWidget: imgWidget,
           btnString: btnString,
         ),
         initialChildren: children,
       );

  static const String name = 'ErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ErrorRouteArgs>();
      return ErrorScreen(
        key: args.key,
        function: args.function,
        showRefresh: args.showRefresh,
        imgString: args.imgString,
        subtitle: args.subtitle,
        title: args.title,
        imgWidget: args.imgWidget,
        btnString: args.btnString,
      );
    },
  );
}

class ErrorRouteArgs {
  const ErrorRouteArgs({
    this.key,
    required this.function,
    this.showRefresh = true,
    this.imgString = "assets/icons/error.svg",
    this.subtitle = "Try refreshing",
    this.title = "Something wrong occured",
    this.imgWidget,
    this.btnString = "Refresh",
  });

  final Key? key;

  final VoidCallback function;

  final bool showRefresh;

  final String imgString;

  final String subtitle;

  final String title;

  final Widget? imgWidget;

  final String btnString;

  @override
  String toString() {
    return 'ErrorRouteArgs{key: $key, function: $function, showRefresh: $showRefresh, imgString: $imgString, subtitle: $subtitle, title: $title, imgWidget: $imgWidget, btnString: $btnString}';
  }
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        LoginRoute.name,
        args: LoginRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>(
        orElse: () => const LoginRouteArgs(),
      );
      return LoginScreen(key: args.key);
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NoInternetScreen]
class NoInternetRoute extends PageRouteInfo<NoInternetRouteArgs> {
  NoInternetRoute({
    Key? key,
    required void Function(bool)? onConnection,
    List<PageRouteInfo>? children,
  }) : super(
         NoInternetRoute.name,
         args: NoInternetRouteArgs(key: key, onConnection: onConnection),
         initialChildren: children,
       );

  static const String name = 'NoInternetRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NoInternetRouteArgs>();
      return NoInternetScreen(key: args.key, onConnection: args.onConnection);
    },
  );
}

class NoInternetRouteArgs {
  const NoInternetRouteArgs({this.key, required this.onConnection});

  final Key? key;

  final void Function(bool)? onConnection;

  @override
  String toString() {
    return 'NoInternetRouteArgs{key: $key, onConnection: $onConnection}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}
