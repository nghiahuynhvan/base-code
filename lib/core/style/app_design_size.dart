// ignore_for_file: unused_element, unused_field
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// {@template app_design_size}
/// Get default size using in app based on device type
/// {@endtemplate}
class AppDesignSize {
  AppDesignSize._();

  /// Padding safe for app about horizontal
  static double paddingSafeHorizontal = 16.w;

  /// Padding safe for app about top
  static double paddingSafeTop = 12.h;

  /// Padding safe for app about bottom in main screen
  static double paddingMainScreenBottom = 40.h;

  /// Get screen size based on device type
  static Size getScreenSize() => Size(1.sw, 1.sh);
}
