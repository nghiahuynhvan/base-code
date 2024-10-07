import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppLogger {
  static final AppLogger singleton = AppLogger._();

  static AppLogger get instance => singleton;

  final bool _isEnableLogger = true;

  late final Logger _logger;

  AppLogger._() {
    _logger = Logger(
      printer: PrettyPrinter(
        printEmojis: false,
        noBoxingByDefault: true,
        colors: false,
      ),
    );
  }

  /// Log a message at level [Level.trace].
  void t(String message) {
    if (_isEnableLogger) {
      _logger.t(message);
    }
  }

  /// Log a message at level [Level.debug].
  void d(String message) {
    if (_isEnableLogger) {
      _logger.d(message);
    }
    debugPrint(message);
  }

  /// Log a message at level [Level.info].
  void i(String message) {
    if (_isEnableLogger) {
      _logger.i(message);
    }
  }

  /// Log a message at level [Level.warning].
  void w(String message) {
    if (_isEnableLogger) {
      _logger.w(message);
    }
  }

  /// Log a message at level [Level.error].
  void e(String? message) {
    if (_isEnableLogger) {
      _logger.e(message);
    }
  }

  /// Log a message at level [Level.fatal].
  void f(String message) {
    if (_isEnableLogger) {
      _logger.f(message);
    }
  }
}
