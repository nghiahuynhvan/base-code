part of 'locators.dart';

///creating [GetIt] for [SplashScreenBloc]
final diSplashScreenBloc = di<SplashScreenBloc>();

///creating [GetIt] for [LoginPageBloc]
final diLoginPageBloc = di<LoginPageBloc>();

/// setup locator related to blocs
void setUpBlocsLocator() {
  di.registerFactory(SplashScreenBloc.new);
  di.registerFactory(LoginPageBloc.new);
}
