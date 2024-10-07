import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/constant.dart';
import '../enums/app_enum.dart';

/// [ThemePreference] class serve data from Shared Preference
/// to views in the context of App Themes.
///
/// Functions include:
/// [fetchThemeApp]
/// [changeTheme]
class ThemePreference {
  late SharedPreferences _pref;

  late ThemeType _appTheme;

  /// Get appLocal current
  ThemeType get appTheme => _appTheme;

  /// Constructor
  ThemePreference() {
    initialize();
  }

  /// initializer
  Future<void> initialize() async {
    _pref = await SharedPreferences.getInstance();
    _appTheme = ThemeType.dark;
    fetchThemeApp();
  }

  /// This function fetch the language of the user's app.
  ThemeType fetchThemeApp() {
    final themeStored = _pref.getString(PrefsConstants.keyThemeSharedPref);
    if (themeStored == null || themeStored.isEmpty) {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      final isDarkMode = brightness == Brightness.dark;
      // Theme default
      _appTheme = isDarkMode ? ThemeType.dark : ThemeType.light;
    } else {
      _appTheme = ThemeType.values.firstWhere((e) => e.name == themeStored);
    }
    return _appTheme;
  }

  /// This function change the app theme.
  Future<void> changeTheme({required ThemeType type}) async {
    _appTheme = type;
    await _pref.setString(PrefsConstants.keyThemeSharedPref, type.name);
  }
}
