import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/style/app_colors.dart';

/// {@template app_loading_dialog_widget}
/// [AppLoadingDialogWidget] returns a state less widget
///
/// [AppLoadingDialogWidget] to show loading dialog in app (above all of screen)
/// {@endtemplate}
class AppLoadingDialogWidget extends StatefulWidget {
  /// {@macro app_loading_dialog_widget}
  const AppLoadingDialogWidget({
    super.key,
  });

  @override
  State<AppLoadingDialogWidget> createState() => _AppLoadingDialogWidget();
}

class _AppLoadingDialogWidget extends State<AppLoadingDialogWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: FittedBox(
        child: Stack(alignment: Alignment.center, children: [
          Center(
            child: SizedBox(
              width: 90,
              height: 90,
              child: CircularProgressIndicator(
                strokeWidth: 3.w,
                //valueColor: const AlwaysStoppedAnimation(Colors.white),
                valueColor: animationController.drive(ColorTween(
                  begin: AppColors.primaryColor,
                  end: AppColors.primaryColor,
                )),
              ),
            ),
          ),
          // Image.asset(
          //   AppIcons.icnApp,
          //   width: AppConstants.logoSizeLoadingPlaceholder,
          //   height: AppConstants.logoSizeLoadingPlaceholder,
          // ),
        ]),
      ),
    );
  }
}
