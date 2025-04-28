// import 'package:dio/dio.dart';

// import 'package:gitpulse/core/constants/api_constants.dart';
// import 'package:gitpulse/core/models/exceptions/network_exception.dart';
// import 'package:gitpulse/core/models/response/api_response.dart';
// import 'package:gitpulse/core/services/network/base_client.dart';
// import 'package:gitpulse/core/services/storage/storage_services.dart';

// class AuthRepo {
//   AuthRepo._();

//   static AuthRepo get instance => AuthRepo._();

//   Future<bool> login(String email, String password) async {
//     try {
//       final response =
//           await BaseClient.instance.postIsolate(ApiConstants.login, data: {
//         "email": email,
//         "password": password,
//       });
//       if ((response["payload"] is String)) {
//         if ((response["payload"] as String).contains("OTP")) {
//           throw "Seems like you are a volunteer, please login as volunteer";
//         }
//       }
//       return LoginResponseModel.fromJson(response["payload"]);
//     } on NetworkExceptions catch (e) {
//       throw e.errorMessage;
//     } catch (e) {
//       throw e.toString();
//     }
//   }

//   Future<void> logout() async {
//     // Logout logic

//     SharedPreferencesImp.logout();
//   }

// }
