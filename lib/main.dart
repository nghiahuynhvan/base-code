import 'package:code_base/initializer.dart';
import 'package:flutter/material.dart';

import 'app.dart';
import 'core/utils/only_one_pointer_recognizer.dart';

void main() {
  Initializer.instance.init(() {
    runApp(const App());
  });
}
