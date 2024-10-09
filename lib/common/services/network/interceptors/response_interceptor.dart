import 'package:dio/dio.dart';

class ResponseInterceptor extends QueuedInterceptor {

  static final instance = ResponseInterceptor._();

  ResponseInterceptor._();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    super.onRequest(options, handler);
  }
}
