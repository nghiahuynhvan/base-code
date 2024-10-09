import 'package:code_base/core/locators/locators.dart';
import 'package:dio/dio.dart';

import '../../../constant/app_errors/network_error.dart';

class ConnectivityInterceptor extends QueuedInterceptor {
  ConnectivityInterceptor._();

  static final instance = ConnectivityInterceptor._();

  final _connectivity = diConnectivityService;

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    ///Check internet
    final isHaveInternet = await _connectivity.isCheckInternet();
    if (isHaveInternet) {
      handler.next(options);
    } else {
      ///Log fault
      final networkError = NetworkError();
      handler.reject(DioException(
        requestOptions: options,
        type: DioExceptionType.cancel,
        response: Response(requestOptions: options, data: networkError),
      ));
    }
  }
}
