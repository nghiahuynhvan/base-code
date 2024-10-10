import 'dart:io';

import 'package:code_base/core/locators/locators.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

///[ConnectivityService] is class get status current of connection
///device with the Internet
class ConnectivityService {
  final _diConnect = diConnectivity;

  ///initialize
  Future<void> initialize() async {
    await isCheckInternet();
  }

  ///Get status current for connectivity
  ///True: If app connected with internet
  Future<bool> isCheckInternet() async {
    final connectivityResult = await _diConnect.checkConnectivity();
    final isHaveInternet =
        await isHaveInternetByConnectivityResult(connectivityResult);
    return isHaveInternet;
  }

  /// Checking is have internet by connectivity result
  Future<bool> isHaveInternetByConnectivityResult(
      List<ConnectivityResult> a) async {
    try {
      final result = await InternetAddress.lookup("google.com");
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        if (a.contains(ConnectivityResult.wifi) ||
            a.contains(ConnectivityResult.mobile) ||
            a.contains(ConnectivityResult.ethernet)) {
          return true;
        }
      } else if (a.contains(ConnectivityResult.none)) {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
