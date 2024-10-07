import 'dart:async';

import 'package:code_base/core/locators/locators.dart';
import 'package:flutter/material.dart';

import 'common/logger/app_logger.dart';

class Initializer {
  static final Initializer _singleton = Initializer._();

  static Initializer get instance => _singleton;

  Initializer._();

  void init(VoidCallback runApp) {
    runZonedGuarded(() async {
      // Returns an instance of the binding that implements WidgetsBinding.
      WidgetsFlutterBinding.ensureInitialized();

      //set up dependencies injector
      setUpLocator();

      runApp();
    }, (error, stack) {
      AppLogger.instance.d('runZonedGuarded: ${error.toString()}');
    });
  }
}
