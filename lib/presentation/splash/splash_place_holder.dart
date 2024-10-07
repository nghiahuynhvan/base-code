import 'package:flutter/material.dart';
import '../../core/style/app_colors.dart';

/// {@template splash_place_holder}
/// Splash place holder during checking auth
/// {@endtemplate}
class SplashPlaceHolder extends StatelessWidget {
  /// {@macro splash_place_holder}
  const SplashPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Center(
        child: Icon(Icons.account_box, color: AppColors.backgroundIconColor,size:200 ,),
      ),
    );
  }
}
