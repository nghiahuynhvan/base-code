part of 'locators.dart';

///creating [GetIt] for [SplashScreenBloc]
final diSplashScreenBloc = di<SplashScreenBloc>();

/// setup locator related to blocs
void setUpBlocsLocator() {
  di.registerFactory(SplashScreenBloc.new);
}
