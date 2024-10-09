import 'package:dio/dio.dart';

class HeaderInterceptor extends QueuedInterceptor {
  static final instance = HeaderInterceptor._();

  HeaderInterceptor._();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final httpIgnore =
        options.path.contains('https://') || options.path.contains('http://');
    if(!httpIgnore)
      {
        var apiUrl = "";
        options.path = apiUrl;
        handler.next(options);
      }
    else {
      handler.next(options);
    }
  }
}
