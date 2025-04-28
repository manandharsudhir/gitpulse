import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:gitpulse/core/constants/api_constants.dart';
import 'package:gitpulse/core/services/network/base_client.dart';
import 'package:gitpulse/features/dashboard/model/log_model.dart';

class DashboardRepo {
  DashboardRepo._();

  static DashboardRepo get instance => DashboardRepo._();

  Future<List<LogModel>> getLogs() async {
    try {
      final response = await Dio().get(
          "https://w7mtvhv3-4000.inc1.devtunnels.ms/get-commit?projectId=973965722");
      log(response.toString());
      return (response.data["data"] as List)
          .map((e) => LogModel.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
