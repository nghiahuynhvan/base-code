part of 'locators.dart';

///create [GetIt] for [Connectivity]
final diConnectivity = di<Connectivity>();

///create [GetIt] for [Dio]
final diDio = di<Dio>();

/// setup locator related to libs
void setUpLibsLocator() {
  di.registerLazySingleton(Connectivity.new);

  di.registerLazySingleton(() {
    return Dio(BaseOptions(
      connectTimeout: const Duration(seconds: 3000),
      receiveTimeout: const Duration(seconds: 3000),
    ));
  });
}
