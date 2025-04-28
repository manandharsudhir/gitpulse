import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:gitpulse/app.dart';
import 'package:gitpulse/core/constants/storage_constant.dart';
import 'package:gitpulse/core/routes/app_router.dart';
import 'package:gitpulse/core/services/storage/storage_services.dart';
import 'package:gitpulse/core/widgets/toast/toast.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import '../../constants/api_constants.dart';
import '../../models/exceptions/network_exception.dart';
import 'network_connection.dart';

class BaseClient {
  BaseClient._() {
    _setupAuthHeaderInterceptor();
  }

  static final BaseClient _instance = BaseClient._();
  static BaseClient get instance => _instance;

  void _setupAuthHeaderInterceptor() {
    _dio.interceptors.addAll([
      // ChuckerDioInterceptor(),
      // QueuedInterceptorsWrapper(
      //   onRequest: (RequestOptions options, RequestInterceptorHandler r) async {
      //     final isAuthenticated = AuthService.instance.isLoggedIn();
      //     options.headers['Accept'] = "*/*";
      //     options.headers["x-client-platform"] = "mobile";
      //     if (isAuthenticated) {
      //       final token = SharedPreferencesImp.read(StorageConstant.token);
      //       options.headers["Authorization"] = "Bearer $token";
      //     }
      //     r.next(options);
      //   },
      //   onError: (e, handler) async {
      //     if ((e.response?.statusCode == 401)) {
      //       // appRouter.replaceAll([LoginRoute()]);
      //       final authService = AuthService.instance;
      //       if (authService.isLoggedIn()) {
      //         try {
      //           await authService.refreshBearerToken();
      //           return handler.resolve(await _retry(e.requestOptions));
      //         } catch (_) {
      //           showErrorToast("Session Expired");
      //           NotificationRepository.instance.deleteToken();
      //           AuthRepo.instance.logout();
      //           SharedPreferencesImp.deleteAll();
      //           appRouter.replace(LoginRoute());
      //           handler.next(e);
      //         }
      //       } else {
      //         showErrorToast("Session Expired");
      //         NotificationRepository.instance.deleteToken();
      //         AuthRepo.instance.logout();
      //         SharedPreferencesImp.deleteAll();
      //         appRouter.replace(LoginRoute());
      //         handler.next(e);
      //       }
      //     } else {
      //       handler.next(e);
      //     }
      //     // appRouter.replaceAll([LoginRoute()]);
      //   },
      // ),
      if (kDebugMode)
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
        )
    ]);
    if (kDebugMode) {
      _tokenDio.interceptors.addAll([
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
        )
      ]);
    }
  }

  final Dio _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseurl,
      contentType: Headers.jsonContentType,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {
        "accept": "application/json",
        "content-type": "application/json"
      },
      responseType: ResponseType.json));

  final Dio _tokenDio = Dio(BaseOptions(
      baseUrl: ApiConstants.baseurl,
      contentType: Headers.jsonContentType,
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      sendTimeout: const Duration(seconds: 30),
      headers: {"accept": "application/json"},
      responseType: ResponseType.json));

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    return _dio.fetch<dynamic>(requestOptions);
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
    bool requireUserId = false,
    bool requireWebId = false,
    bool requireRole = false,
    bool requireClientPlatform = false,
  }) async {
    Map<String, dynamic> localHeader = headers ?? {};
    if (requireUserId) {
      localHeader["x-user-id"] =
          SharedPreferencesImp.read(StorageConstant.userId);
    }
    if (requireWebId) {
      localHeader["x-web-id"] =
          SharedPreferencesImp.read(StorageConstant.webId);
    }
    if (requireRole) {
      localHeader["x-user-role"] =
          SharedPreferencesImp.read(StorageConstant.userId);
    }
    if (requireClientPlatform) {
      localHeader["x-client-platform"] =
          SharedPreferencesImp.read(StorageConstant.mobile);
    }
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        final res = await _dio.get(
          uri,
          queryParameters: queryParameters,
          options: Options(headers: localHeader),
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> post(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool requireUserId = false,
    bool requireWebId = false,
    bool requireRole = false,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      Map<String, dynamic> localHeader = options?.headers ?? {};

      if (requireUserId) {
        localHeader["x-user-id"] =
            SharedPreferencesImp.read(StorageConstant.userId);
      }
      if (requireWebId) {
        localHeader["x-web-id"] =
            SharedPreferencesImp.read(StorageConstant.webId);
      }
      if (requireRole) {
        localHeader["x-user-role"] =
            SharedPreferencesImp.read(StorageConstant.userId);
      }
      try {
        final res = await _dio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options == null
              ? Options(headers: localHeader)
              : options.copyWith(headers: localHeader),
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<dynamic> getIsolate(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool requireClientPlatform = true,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        Map<String, dynamic> localHeader = options?.headers ?? {};
        if (requireClientPlatform) {
          localHeader["x-client-platform"] = "mobile";
        }
        final res = await _tokenDio.get(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options?.copyWith(headers: localHeader) ??
              Options(headers: localHeader),
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  Future<dynamic> postIsolate(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool requireClientPlatform = true,
  }) async {
    if (await NetworkConnectionCheck.checkConnection()) {
      try {
        Map<String, dynamic> localHeader = {};
        if (requireClientPlatform) {
          localHeader["x-client-platform"] = "mobile";
        }
        final res = await _tokenDio.post(
          uri,
          data: data,
          queryParameters: queryParameters,
          options: options?.copyWith(headers: localHeader) ??
              Options(headers: localHeader),
          cancelToken: cancelToken,
        );
        return res.data;
      } on DioException catch (e) {
        throw e.toNetworkException();
      } catch (e) {
        rethrow;
      }
    } else {
      throw const NetworkExceptions.noInternetConnection();
    }
  }

  /// return response body or throws [NetworkExceptions]
  Future<dynamic> put(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool requireUserId = false,
    bool requireWebId = false,
    bool requireRole = false,
  }) async {
    try {
      Map<String, dynamic> localHeader = {};

      if (requireUserId) {
        localHeader["x-user-id"] =
            SharedPreferencesImp.read(StorageConstant.userId);
      }
      if (requireWebId) {
        localHeader["x-web-id"] =
            SharedPreferencesImp.read(StorageConstant.webId);
      }
      if (requireRole) {
        localHeader["x-user-role"] =
            SharedPreferencesImp.read(StorageConstant.userId);
      }
      final response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: localHeader),
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.toNetworkException();
    } on NetworkExceptions catch (_) {
      rethrow;
    }
  }

  Future<dynamic> patch(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool requireUserId = false,
    bool requireWebId = false,
    bool requireRole = false,
  }) async {
    Map<String, dynamic> localHeader = {};

    if (requireUserId) {
      localHeader["x-user-id"] =
          SharedPreferencesImp.read(StorageConstant.userId);
    }
    if (requireWebId) {
      localHeader["x-web-id"] =
          SharedPreferencesImp.read(StorageConstant.webId);
    }
    if (requireRole) {
      localHeader["x-user-role"] =
          SharedPreferencesImp.read(StorageConstant.userId);
    }
    try {
      final response = await _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: localHeader,
        ),
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.toNetworkException();
    } on NetworkExceptions catch (_) {
      rethrow;
    }
  }

  Future<dynamic> delete(
    String uri, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    bool requireUserId = false,
    bool requireWebId = false,
    bool requireRole = false,
  }) async {
    try {
      Map<String, dynamic> localHeader = {};

      if (requireUserId) {
        localHeader["x-user-id"] =
            SharedPreferencesImp.read(StorageConstant.userId);
      }
      if (requireWebId) {
        localHeader["x-web-id"] =
            SharedPreferencesImp.read(StorageConstant.webId);
      }
      if (requireRole) {
        localHeader["x-user-role"] =
            SharedPreferencesImp.read(StorageConstant.userId);
      }
      final response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: Options(headers: localHeader),
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioException catch (e) {
      throw e.toNetworkException();
    } on NetworkExceptions catch (_) {
      rethrow;
    }
  }
}
