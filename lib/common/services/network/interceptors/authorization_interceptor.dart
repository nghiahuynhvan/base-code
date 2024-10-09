import 'package:dio/dio.dart';

class AuthorizationInterceptor extends QueuedInterceptor {
  static final instance = AuthorizationInterceptor._();

  AuthorizationInterceptor._();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    /// get from authService
    var accessToken = 'token';
    options.headers['Authorization'] = "Bearer $accessToken";
    super.onRequest(options, handler);

  }
}
