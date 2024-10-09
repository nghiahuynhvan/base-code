import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../core/locators/locators.dart';

import '../../logger/app_logger.dart';
import 'interceptors/authorization_interceptor.dart';
import 'interceptors/connectivity_interceptor.dart';
import 'interceptors/header_interceptor.dart';
import 'interceptors/response_interceptor.dart';

/// [CustomHttpClient] have different abstract method that are used
/// interact with API.
abstract class CustomHttpClient {
  /// Method to make http GET request
  /// regarding rocket, it is only used in situations
  /// has filter and is only used in rocket. If normal APIs were possible
  /// ignore it.
  Future<dynamic> get(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      });

  /// Method to make http POST request
  Future<dynamic> post(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        @required dynamic body,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      });

  /// Method to make http DELETE request
  Future<dynamic> delete(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        dynamic body,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      });

  /// Method to make http PUT request
  Future<dynamic> put(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        @required dynamic body,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      });

  /// Method to make http PATCH request
  Future<dynamic> patch(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? extra,
        @required dynamic body,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      });

  /// Method to make download the file and save it in local.
  Future<dynamic> download(
      String url,
      String savePath,
      String name,
      ProgressCallback? onReceiveProgress, {
        Map<String, dynamic> headers,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      });

  /// Method to make upload the file.
  Future<dynamic> upload(
      String url,
      File file, {
        dynamic body,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
        bool isDisplayProgress = false,
        String keyFormFile = "file",
      });
}

/// {@template http_client_impl}
/// This class implement abstract method in [CustomHttpClient] class
/// {@endtemplate}
class HttpClientImpl implements CustomHttpClient {
  late final Dio _dio;

  /// {@macro http_client_impl}
  HttpClientImpl() {
    _dio = diDio;
    // add interceptors
    _dio
      ..interceptors.clear()
      ..interceptors.add(ConnectivityInterceptor.instance)
      ..interceptors.add(HeaderInterceptor.instance)
      // ..interceptors.add(LoggingInterceptor.instance)
      // ..interceptors.add(ResponseInterceptor.instance)
      ..interceptors.add(AuthorizationInterceptor.instance);
  }

  @override
  Future<dynamic> get(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      }) async {
    try {
      final response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: Options(headers: headers, extra: {
        }),
      );
      return response.data;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<dynamic> post(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        @required dynamic body,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      }) async {
    try {
      final response = await _dio.post(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers, extra: {

        }),
      );
      return response.data;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<dynamic> delete(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        dynamic body,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      }) async {
    try {
      final response = await _dio.delete(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers, extra: {

        }),
      );
      return response.data;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future put(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        @required dynamic body,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      }) async {
    try {
      final response = await _dio.put(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers, extra: {
          ...?extra,
        }),
      );
      return response.data;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future patch(
      String url, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? extra,
        @required dynamic body,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      }) async {
    try {
      final response = await _dio.patch(
        url,
        data: body,
        queryParameters: queryParameters,
        options: Options(headers: headers, extra: {
          ...?extra,
        }),
      );
      return response.data;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future download(
      String url,
      String savePath,
      String name,
      ProgressCallback? onReceiveProgress, {
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
      }) async {
    try {
      await _dio.download(url, savePath,
          onReceiveProgress: onReceiveProgress,
          options: Options(headers: headers, extra: {
            ...?extra,
          }));
      return true;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future upload(
      String url,
      File file, {
        dynamic body,
        Map<String, dynamic>? headers,
        Map<String, dynamic>? extra,
        bool authorization = true,
        bool isDisplayErrorDialog = false,
        bool isDisplayNetworkError = false,
        bool isDisplayProgress = false,
        String keyFormFile = "file",
      }) async {
    try {
      var fileName = file.path.split('/').last;
      var data = FormData.fromMap({
        "file": await MultipartFile.fromFile(
          file.path,
          filename: fileName,
        ),
      });
      final res = await _dio.post(url,
          data: data,
          options: Options(headers: headers, extra: {
            ...?extra,
          }));
      return res.data;
    } on DioException catch (e) {
      AppLogger.instance.e(e.message);
      rethrow;
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
