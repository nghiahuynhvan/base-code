part of 'locators.dart';
///creating [GetIt] for [ThemePreference]
final diThemePreference = di<ThemePreference>();

///creating [GetIt] for [AuthenticationPreference]
final diAuthenticationPreference = di<AuthenticationPreference>();

void setUpSharedPreference() {
  di.registerSingleton(ThemePreference());
  di.registerSingletonAsync(() async {
    final pref = AuthenticationPreference();
    await pref.initialize();
    return pref;
  });
}
