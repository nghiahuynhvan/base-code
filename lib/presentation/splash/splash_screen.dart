import 'package:code_base/presentation/splash/splash_place_holder.dart';
import 'package:flutter/material.dart';
import '../../core/locators/locators.dart';
import 'splash_screen_bloc.dart';

/// {@template splash_screen}
/// [SplashScreen] returns a widget that has mutable state [_SplashScreenState].
/// [StatefulWidget] which consumes a [SplashScreenBloc]
/// and responds to changes in the [SplashScreenState].
/// {@endtemplate}
class SplashScreen extends StatefulWidget {
  /// {@macro splash_screen}
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    diSplashScreenBloc.add(const SplashStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return const SplashPlaceHolder();
  }
}
