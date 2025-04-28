import 'package:package_info_plus/package_info_plus.dart';

class PackageInfoService {
  PackageInfoService._();
  static PackageInfo? packageInfo;
  PackageInfo get instance =>
      packageInfo ?? (throw Exception("Not Initialized"));

  static Future<void> init() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  static String versionNumber() {
    return packageInfo?.version ?? "";
  }
}
