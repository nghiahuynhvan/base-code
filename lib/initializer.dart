import 'dart:async';

import 'package:code_base/core/locators/locators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

      //set up firebase
      await Firebase.initializeApp();


      runApp();
    }, (error, stack) {
      AppLogger.instance.d('runZonedGuarded: ${error.toString()}');
    });
  }
}
