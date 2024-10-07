part of 'locators.dart';

final diThemePreference = di<ThemePreference>();

void setUpSharedPreference() {
  di.registerSingleton(ThemePreference());
}
