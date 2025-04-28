import 'package:internet_connection_checker/internet_connection_checker.dart';

class NetworkConnectionCheck {
  static final InternetConnectionChecker _internetConnectionChecker =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 30),
    checkInterval: const Duration(seconds: 30),
  );
  static Future<bool> checkConnection() async {
    bool result = await _internetConnectionChecker.hasConnection;
    return result;
  }
}
