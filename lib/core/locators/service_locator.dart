part of 'locators.dart';

///Create [GetIt] fot [ConnectivityService]
final diConnectivityService = di<ConnectivityService>();

///Create [GetIt] fot [ConnectivityService]
final diCustomHttpClient = di<CustomHttpClient>();

void setUpServiceLocator() {
  di.registerSingletonAsync(() async {
    final service = ConnectivityService();
    await service.initialize();
    return service;
  });
  di.registerSingletonWithDependencies<CustomHttpClient>(HttpClientImpl.new,
      dependsOn: [ConnectivityService]);
}
