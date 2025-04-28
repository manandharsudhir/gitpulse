import 'package:dio/dio.dart';

import 'package:gitpulse/core/constants/api_constants.dart';
import 'package:gitpulse/core/models/exceptions/network_exception.dart';
import 'package:gitpulse/core/models/response/api_response.dart';
import 'package:gitpulse/core/services/network/base_client.dart';
import 'package:gitpulse/core/services/storage/storage_services.dart';
import 'package:gitpulse/features/auth/model/login_response_model.dart';

class AuthRepo {
  AuthRepo._();

  static AuthRepo get instance => AuthRepo._();

  // Future<LoginResponseModel> login(String email, String password) async {
  //   try {
  //     final response =
  //         await BaseClient.instance.postIsolate(ApiConstants.login, data: {
  //       "email": email,
  //       "password": password,
  //     });

  //     return LoginResponseModel.fromJson(response);
  //   } on NetworkExceptions catch (e) {
  //     throw e.errorMessage;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Future<LoginResponseModel> socialAuth({
  //   required String provider,
  //   required String token,
  //   Map<String, dynamic>? queryParameters,
  // }) async {
  //   try {
  //     final response = await BaseClient.instance.getIsolate(
  //         ApiConstants.socialAuth(accessToken: token, provider: provider),
  //         queryParameters: queryParameters);

  //     return LoginResponseModel.fromJson(response["payload"]);
  //   } on NetworkExceptions catch (e) {
  //     throw e.errorMessage;
  //   } catch (e) {
  //     throw e.toString();
  //   }
  // }

  // Future<void> logout() async {
  //   // Logout logic

  //   SharedPreferencesImp.logout();
  // }
}
