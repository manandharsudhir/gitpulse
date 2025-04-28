import 'package:gitpulse/core/constants/api_constants.dart';
import 'package:gitpulse/core/services/network/base_client.dart';
import 'package:gitpulse/features/dashboard/model/log_model.dart';

class DashboardRepo {
  DashboardRepo._();

  static DashboardRepo get instance => DashboardRepo._();

  Future<List<LogModel>> getLogs() async {
    try {
      final response = await BaseClient.instance.get(ApiConstants.githubLogin);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
