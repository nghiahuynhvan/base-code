part of 'locators.dart';

///creating [GetIt] for [AppRouter]
final diAppRouter = di<AppRouter>();

/// setup locator related to app routers
void setUpAppRoutersLocator() {
  di.registerSingleton(AppRouter());
}
