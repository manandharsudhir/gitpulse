// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gitpulse/core/utils/extensions/string_extension.dart';
part 'network_exception.freezed.dart';

@freezed
class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled(
      [@Default('Request cancelled') String errorMessage]) = _RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest(
          [@Default('Unauthorized request') String errorMessage]) =
      _UnauthorisedRequest;

  const factory NetworkExceptions.badRequest(
      [@Default('Bad request') String errorMessage]) = _BadRequest;

  const factory NetworkExceptions.notFound(
      [@Default('Not found') String errorMessage]) = _NotFound;

  const factory NetworkExceptions.methodNotAllowed(
      [@Default('Method not allowed') String errorMessage]) = _MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable(
      [@Default('Not acceptable') String errorMessage]) = _NotAcceptable;

  const factory NetworkExceptions.connectionTimeout(
      [@Default('Request timeout') String errorMessage]) = _ConnectionTimeout;

  const factory NetworkExceptions.receiveTimeout(
      [@Default('Receive timeout') String errorMessage]) = _ReceiveTimeout;

  const factory NetworkExceptions.sendTimeout(
      [@Default('Send timeout') String errorMessage]) = _SendTimeout;

  const factory NetworkExceptions.requestTimeout(
      [@Default('Request timeout') String errorMessage]) = _RequestTimeout;

  const factory NetworkExceptions.conflict(
      [@Default('Conflict') String errorMessage]) = _Conflict;

  const factory NetworkExceptions.internalServerError(
          [@Default('Internal server error') String errorMessage]) =
      _InternalServerError;

  const factory NetworkExceptions.serviceUnavailable(
          [@Default('Service unavailable') String errorMessage]) =
      _ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection(
          [@Default('No internet conection') String errorMessage]) =
      _NoInternetConnection;

  const factory NetworkExceptions.formatException(
      [@Default('Format exception') String errorMessage]) = _FormatException;

  const factory NetworkExceptions.unableToProcess(
      [@Default('Unable to process') String errorMessage]) = UnableToProcess;

  const factory NetworkExceptions.defaultError(
      [@Default('Something went wrong') String errorMessage]) = _DefaultError;

  const factory NetworkExceptions.unexpectedError(
      [@Default('Unexpected error') String errorMessage]) = _UnexpectedError;

  const factory NetworkExceptions.preconditionFailed(
          [@Default('Precondition failed') String errorMessage]) =
      _PreconditionFailed;

  const factory NetworkExceptions.forbidden(
      [@Default('Forbidden') String errorMessage]) = _Forbidden;

  const factory NetworkExceptions.tooManyRequest(
      [@Default('Too many request') String errorMessage]) = _TooManyRequest;
}

extension DioToNetworkException on DioException {
  NetworkExceptions toNetworkException() {
    NetworkExceptions networkExceptions;
    switch (type) {
      case DioExceptionType.cancel:
        networkExceptions = const NetworkExceptions.requestCancelled();
        break;
      case DioExceptionType.connectionTimeout:
        networkExceptions = const NetworkExceptions.connectionTimeout();
        break;
      case DioExceptionType.sendTimeout:
        networkExceptions = const NetworkExceptions.sendTimeout();
        break;
      case DioExceptionType.receiveTimeout:
        networkExceptions = const NetworkExceptions.receiveTimeout();
        break;
      case DioExceptionType.badResponse:
        // we get some response from server so needed to use response here.
        final String? errorMessage =
            (response!.data is List) || (response!.data is Map)
                ? response!.data['message'] as String?
                : response!.data.toString();
        switch (response!.statusCode) {
          case 400:
            final errorResponse = response!.data as Map<String, dynamic>;
            if (errorResponse.keys.contains("payload")) {
              final finalErrorResponse = (errorResponse["payload"] is Map)
                  ? (errorResponse["payload"] as Map).values.first
                  : (errorResponse["payload"] is List)
                      ? errorResponse["payload"][0]
                      : errorResponse["payload"];
              networkExceptions = NetworkExceptions.badRequest(
                  finalErrorResponse
                      .toString()
                      .capitalizeFirstLetter()
                      .addFullStop());
            } else if (errorResponse.keys.contains("message")) {
              final finalErrorResponse = (errorResponse["message"] is Map)
                  ? (errorResponse["message"] as Map).values.first
                  : (errorResponse["message"] is List)
                      ? errorResponse["message"][0]
                      : errorResponse["message"];
              networkExceptions = NetworkExceptions.badRequest(
                  finalErrorResponse
                      .toString()
                      .capitalizeFirstLetter()
                      .addFullStop());
            } else {
              networkExceptions = NetworkExceptions.badRequest(
                  errorResponse.toString().addFullStop());
            }

            break;
          case 401:
            networkExceptions = NetworkExceptions.unauthorisedRequest(
                errorMessage ?? 'Unauthorized request');
            break;
          // case 403:
          //   networkExceptions =
          //       NetworkExceptions.forbidden(errorMessage ?? 'Forbidden');
          // break;
          case 404:
            networkExceptions = const NetworkExceptions.notFound('Not found');
            break;
          case 408:
            networkExceptions =
                const NetworkExceptions.requestTimeout('Request timeout');
            break;
          case 409:
            final errorResponse = response!.data as Map<String, dynamic>;
            networkExceptions = NetworkExceptions.conflict(
                errorResponse["message"] ?? "Conflict");
            break;
          case 204:
            // OneSignal.User.removeAlias("external_id");
            // OneSignal.logout();
            // SharedPreferencesImp.delete(StorageConstant.token);
            // SharedPreferencesImp.delete(StorageConstant.refreshToken);
            // appRouter.replaceAll([const SplashRoute()]);
            networkExceptions =
                const NetworkExceptions.notFound("Deleted user");
            break;

          // case 412:
          //   networkExceptions = NetworkExceptions.preconditionFailed(
          //       errorMessage ?? 'Precondition failed');
          //   break;
          // case 429:
          //   networkExceptions = NetworkExceptions.tooManyRequest(
          //       errorMessage ?? 'Too many requests');
          //   break;
          // case 422:
          // final errorResponse = UnprocessedModel.fromJson(response!.data);
          // if (errorResponse.errors!.email!.isNotEmpty) {
          //   networkExceptions = NetworkExceptions.unableToProcess(
          //       errorResponse.errors!.email![0]);
          // } else if (errorResponse.errors!.name!.isNotEmpty) {
          //   networkExceptions = NetworkExceptions.unableToProcess(
          //       errorResponse.errors!.name![0]);
          // } else if (errorResponse.errors!.password!.isNotEmpty) {
          //   networkExceptions = NetworkExceptions.unableToProcess(
          //       errorResponse.errors!.password![0]);
          // } else if (errorResponse.errors!.phone!.isNotEmpty) {
          //   networkExceptions = NetworkExceptions.unableToProcess(
          //       errorResponse.errors!.phone![0]);
          // } else {
          //   networkExceptions = NetworkExceptions.unableToProcess(
          //       errorResponse.message ?? 'Unable to process data');
          // }
          // break;
          case 500:
            networkExceptions = NetworkExceptions.internalServerError(
                'Internal server error'.addFullStop());
            break;
          // case 503:
          //   networkExceptions = NetworkExceptions.serviceUnavailable(
          //       errorMessage ?? 'Service unavailable');
          //   break;
          default:
            networkExceptions = NetworkExceptions.defaultError(
              errorMessage ??
                  "Received invalid status code: ${response!.statusCode}"
                      .addFullStop(),
            );
        }
        break;
      case DioExceptionType.unknown:
        // we got some other kind of errors like socket exception or
        // network exception etc
        if (error is SocketException) {
          networkExceptions = const NetworkExceptions.noInternetConnection();
        } else if (error is FormatException) {
          networkExceptions = const NetworkExceptions.formatException();
        } else {
          networkExceptions = const NetworkExceptions.unexpectedError();
        }
        break;
      default:
        networkExceptions = const NetworkExceptions.unexpectedError();
    }
    return networkExceptions;
  }
}
