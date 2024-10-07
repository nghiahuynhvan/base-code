/// {@template app_font_family}
/// Get font family using in app based on device type, OS type
/// {@endtemplate}
class AppFontFamily {
  /// Source Han Sands JP font family
  late final String beVietNamPro;

  /// {@macro app_font_family}
  AppFontFamily() {
    beVietNamPro = "BeVietnamPro";
  }

  /// Get font family based on device type, OS type
  /// Mobile size: Size(375, 718)
  /// Tablet size: Size(744, 1113)
  ///
  /// Calculate mobile and tablet device type base screen size
  ///
  /// if ((orientation == Orientation.portrait && screenWidth < 600) ||
  ///   (orientation == Orientation.landscape && screenHeight < 600)) {
  ///   deviceType = DeviceType.mobile;
  /// } else {
  ///   deviceType = DeviceType.tablet;
  /// }
  String getFontFamily() {
    // This is code get font base on screen size
    /*final deviceType = ScreenUtil().deviceType();
    AppLogger.instance.d("App device type: $deviceType");
    if (deviceType == DeviceType.tablet) {
      return sourceHanSandsJP;
    }
    return sourceHanSandsJP;*/
    return beVietNamPro;
  }
}
