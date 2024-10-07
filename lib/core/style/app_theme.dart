// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

/// [AppTheme] contains various custom themes and colors necessary for themes.
/// Themes include:
/// [darkTheme]
/// [lightTheme]
/// These are imported to other files/widgets to apply the required themes.
class AppTheme {
  AppTheme._();

  /// Colors of dark theme
  // HexColor: 0xFF030F36
  static const Color _darkPrimaryColor = Colors.white;

  // HexColor: 0xFF030F36
  static const Color _darkBasePrimaryColor = Colors.purple;

  // HexColor: 0xFF1C2B5C
  static const Color _darkSecondaryColor = Colors.purple;

  // HexColor: 0xFF030F36
  static const Color _darkBaseAccent1Color = Colors.purple;

  // HexColor: 0xFF030F36
  static const Color _darkBaseAccent2Color = Colors.purple;

  // HexColor: 0xFFFFFFFF
  static const Color _dartTextBodyColor = Colors.purple;

  /// TODO: Currently darkTheme and light Theme are defined the same
  /// If there is support for multiple themes in the future, then yes
  /// Re-define the themes accordingly
  /// Dark theme for app
  static final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      surfaceTintColor: AppColors.transparent,
      backgroundColor: AppColors.transparent,
      iconTheme: IconThemeData(color: AppColors.headingColor),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.whiteColor,
        systemNavigationBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: const TextTheme().bodyLarge?.copyWith(
        color: _dartTextBodyColor,
      ),
      bodyMedium: const TextTheme().bodyMedium?.copyWith(
        color: _dartTextBodyColor,
      ),
      bodySmall: const TextTheme().bodySmall?.copyWith(
        color: _dartTextBodyColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _darkBasePrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        maximumSize: const Size(double.infinity, 56),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      hintStyle: TextStyle(color: Colors.red),
      filled: true,
      fillColor: Colors.white,
      errorMaxLines: 3,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.transparent,
      surfaceTintColor: AppColors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //selectedLabelStyle: AppTextStyle.regularTiny,
      selectedItemColor: _darkPrimaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    // splashFactory: AppInkRipple.splashFactory,
    // Disable splash effect
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );

  /// Light theme for app
  static final lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    appBarTheme: AppBarTheme(
      surfaceTintColor: AppColors.transparent,
      backgroundColor: AppColors.transparent,
      iconTheme: IconThemeData(color: AppColors.headingColor),
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: AppColors.whiteColor,
        systemNavigationBarColor: AppColors.whiteColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: const TextTheme().bodyLarge?.copyWith(
        color: _dartTextBodyColor,
      ),
      bodyMedium: const TextTheme().bodyMedium?.copyWith(
        color: _dartTextBodyColor,
      ),
      bodySmall: const TextTheme().bodySmall?.copyWith(
        color: _dartTextBodyColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: _darkBasePrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
        maximumSize: const Size(double.infinity, 56),
        minimumSize: const Size(double.infinity, 56),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      enabledBorder: InputBorder.none,
      disabledBorder: InputBorder.none,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      hintStyle: TextStyle(color: Colors.red),
      filled: true,
      fillColor: Colors.white,
      errorMaxLines: 3,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.transparent,
      surfaceTintColor: AppColors.transparent,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //selectedLabelStyle: AppTextStyle.regularTiny,
      selectedItemColor: _darkPrimaryColor,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 0,
    ),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
    // splashFactory: AppInkRipple.splashFactory,
    // Disable splash effect
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
  );
}
