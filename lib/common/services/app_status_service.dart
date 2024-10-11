import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../core/style/app_colors.dart';

import '../../shared/dialog/app_alert_dialog_widget.dart';
import '../../shared/dialog/app_loading_dialog_widget.dart';
import '../constant/app_errors/app_other_error.dart';

import '../logger/app_logger.dart';

/// [AppStatus] extension
class AppStatus {
  AppStatus._();

  /// Exceptions request API stored when app first loading, if it is not null
  /// then have something error occur.
  /// And need to handle it in splash screen.
  ///
  /// Usually SocketException error
  static AppOtherError? _exceptionRequestAPIStored;

  /// The app is already inside and is being used by the user
  /// Begin Splash screen
  static bool appIsAlreadyInside = true;

  /// Global key of scaffold in main screen
  static final GlobalKey<ScaffoldState> scaffoldKeyMainScreen = GlobalKey();

  /// Global key of scaffold in app screen
  static final GlobalKey<NavigatorState> rootNavigationState = GlobalKey();

  /// Screen util lib
  static final ScreenUtil _deviceType = ScreenUtil();

  /// Call [appShowAlertDialog] if app need to show alert dialog view
  /// with message and dialog, change app state become AppStatusShowingDialog
  static void appShowAlertDialog({
    String? title,
    required String content,
    required String image,
    required String labelCancel,
    required VoidCallback onPressCancel,
    String? labelConfirm,
    VoidCallback? onPressConfirm,
    double borderRadius = 14,
    Color? backgroundColor,
    Color? colorBorderSide,
  }) {
    if (SmartDialog.config.custom.isExist) return;
    SmartDialog.show(
      debounce: true,
      clickMaskDismiss: false,
      animationTime: const Duration(milliseconds: 250),
      maskColor: AppColors.whiteColor.withOpacity(0.6),
      builder: (context) {
        return AppAlertDialogWidget(
          title: title,
          content: content,
          image: image,
          labelCancel: labelCancel,
          onPressCancel: onPressCancel,
          labelConfirm: labelConfirm,
          onPressConfirm: onPressConfirm,
          borderRadius: borderRadius,
          backgroundColor: backgroundColor,
          colorBorderSide: colorBorderSide,
        );
      },
    );
  }

  /// Call [appShowWarningDialog] if app need to show warning dialog view
  /// with message and dialog, change app state become AppStatusShowingDialog
  // static void appShowWarningDialog({
  //   required String title,
  //   required Widget content,
  //   Widget? iconWarning,
  //   required String labelConfirm,
  //   required VoidCallback onPressConfirm,
  //   String? labelCancel,
  //   VoidCallback? onPressCancel,
  //   double borderRadius = 14,
  //   Color? backgroundColor,
  //   Color? colorBorderSide,
  // }) {
  //   if (SmartDialog.config.custom.isExist) return;
  //   SmartDialog.show(
  //     debounce: true,
  //     clickMaskDismiss: false,
  //     animationTime: const Duration(milliseconds: 250),
  //     maskColor: AppColors.whiteColor.withOpacity(0.6),
  //     builder: (context) {
  //       return AppWarningDialogWidget(
  //         iconWarning: iconWarning,
  //         title: title,
  //         content: content,
  //         labelCancel: labelCancel,
  //         onPressCancel: onPressCancel,
  //         labelConfirm: labelConfirm,
  //         onPressConfirm: onPressConfirm,
  //         borderRadius: borderRadius,
  //         backgroundColor: backgroundColor,
  //         colorBorderSide: colorBorderSide,
  //       );
  //     },
  //   );
  // }

  /// Call [appShowWarningDialog] if app need to show discard dialog dialog view
  // static void appShowDiscardConfirmDialog() {
  //   AppStatus.appShowWarningDialog(
  //     title: 'Discardchange',
  //     content: Text(
  //       'discard',
  //       style: AppTextStyle.regular14,
  //       textAlign: TextAlign.center,
  //     ),
  //     labelCancel: 'tiep tuc',
  //     onPressCancel: () => AppStatus.dismissAllStatus(),
  //     labelConfirm: '',
  //     onPressConfirm: () {
  //       AppStatus.dismissAllStatus();
  //       diAppRouter.router.pop();
  //     },
  //   );
  // }

  /// Call [showDialog] if app need to show dialog view
  static void showDialog({
    required Widget child,
    bool? clickMaskDismiss,
    VoidCallback? onDismiss,
  }) {
    if (SmartDialog.config.custom.isExist) return;
    SmartDialog.show(
      debounce: true,
      clickMaskDismiss: clickMaskDismiss ?? false,
      alignment: Alignment.center,
      maskColor: Colors.black.withOpacity(.2),
      animationTime: const Duration(milliseconds: 250),
      onDismiss: onDismiss,
      builder: (context) {
        return child;
      },
    );
  }

  /// Call [showLoading] if app need to show progress view
  /// and change app state become AppStatusLoading
  static void showLoading() {
    if (appIsAlreadyInside) {
      if (SmartDialog.config.loading.isExist) return;
      SmartDialog.showLoading(
        msg: '',
        maskColor: AppColors.whiteColor.withOpacity(0.6),
        builder: (context) {
          return const AppLoadingDialogWidget();
        },
      );
    }
  }

  /// Call [showToast] if app need to show toast view
  /// and change app state become AppStatusLoading
  static void showToast(
      String message, {
        Duration? displayTime,
        bool isPaddingBottom = false,
        bool? clickMaskDismiss,
      }) {
    // if (appIsAlreadyInside) {
    //   _showToast(
    //     message,
    //     isPaddingBottom: isPaddingBottom,
    //     displayTime: displayTime,
    //     clickMaskDismiss: clickMaskDismiss,
    //   );
    // }
  }

  /// Call [dismissLoading] if app need to dismiss only loading
  static void dismissLoading({int seconds = 1}) async {
    if (appIsAlreadyInside) {
      await Future.delayed(Duration(seconds: seconds));
      _dismissLoading();
    }
  }

  /// Call [dismissLoading] if app need to dismiss progress view
  /// and change app state become AppStatusDone
  /// The state of is done all of states.
  /// if progress view is showing -> Close progress
  /// if any errors state -> Close errors warning dialog or alert
  static void dismissAllStatus({
    SmartStatus status = SmartStatus.smart,
  }) {
    if (appIsAlreadyInside) SmartDialog.dismiss(status: status);
  }

  /// Set status app is already inside app screen's & is being used by the user
  /// Begin Splash screen
  static void setStatusAppAlreadyInside({required bool isReadyInside}) {
    AppLogger.instance.d("Set status app already inside: $isReadyInside");
    appIsAlreadyInside = isReadyInside;
  }

  /// Set exception occur when request API
  ///
  /// Usually SocketException error or exception timeout
  /// It can not connect to server
  static void exceptionConnectServer({
    required AppOtherError error,
  }) {
    AppLogger.instance.d("Occur exception error: ${error.exception}");
    if (error != _exceptionRequestAPIStored) {
      _exceptionRequestAPIStored = error;
    }
    if (appIsAlreadyInside) {
      /* FirebaseLoggerManager.instance.logEvent(
          event: AppEventDefine.common.cannotConnectServer,
          parameters: {
            LogEventsConstants.messageKeyLogEvent: error.messageError
          });*/
      _exceptionRequestAPIStored = error;
      dismissLoading();
      appShowAlertDialog(
        content: 'abc',
        image: 'abc' ,
        labelCancel: 'OK',
        onPressCancel: () {
          _exceptionRequestAPIStored = null;
          dismissAllStatus();
        },
      );
    }
  }

  /// Check your device's internet connection status
  ///
  /// [type] Alert action when there is no internet connection
  // static Future<bool> checkingInternet({
  //   NetworkAlertType type = NetworkAlertType.none,
  //   bool isToastPaddingBottom = true,
  // }) async {
  //   final isHaveInternet = await diConnectivityService.isHaveInternet();
  //   if (!isHaveInternet) {
  //     switch (type) {
  //       case NetworkAlertType.none:
  //         break;
  //       case NetworkAlertType.toast:
  //         _showToast(
  //             "${SLang.current.labelNetworkErrorPlaceHolder}"
  //                 " ${SLang.current.requestNetworkErrorPlaceHolder}",
  //             isPaddingBottom: isToastPaddingBottom);
  //         break;
  //       case NetworkAlertType.dialog:
  //         appShowAlertDialog(
  //           content: 'Connect server error',
  //           image: AppIcons.icnApp,
  //           labelCancel: 'Cancel',
  //           onPressCancel: dismissAllStatus,
  //         );
  //         break;
  //     }
  //   }
  //   return isHaveInternet;
  // }

  // static void _showToast(
  //     String message, {
  //       bool isPaddingBottom = true,
  //       Duration? displayTime,
  //       bool? clickMaskDismiss,
  //     }) {
  //   if (SmartDialog.config.toast.isExist) return;
  //   SmartDialog.showToast(message,
  //       displayType: SmartToastType.last,
  //       clickMaskDismiss: clickMaskDismiss,
  //       displayTime: displayTime,
  //       debounce: true,
  //       builder: (_) =>
  //           AppToastWidget(message: message, isPaddingBottom: isPaddingBottom));
  // }

  static void _dismissLoading() {
    SmartDialog.dismiss(status: SmartStatus.loading);
  }

  /// Get global context
  static BuildContext? getGlobalContext() {
    return rootNavigationState.currentState?.overlay?.context;
  }

  /// Get global context
  static void globalPopBack<T extends Object?>([T? result]) {
    final context = getGlobalContext();
    if (context != null && context.mounted) context.pop(result);
  }

  /// Check if the current app is a tablet device
  static bool isTablet(BuildContext context) {
    return _deviceType.deviceType(context) == DeviceType.tablet;
  }

  /// Check if the current app is a mobile device
  static bool isMobile(BuildContext context) {
    return _deviceType.deviceType(context) == DeviceType.mobile;
  }

  /// Checking is showing keyboard
  static bool isOpenKeyboard(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom != 0;
  }

  /// Closing keyboard is showing
  static void closeKeyboard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  /// Enable multiple touching
  // static void enableMultipleTouching() {
  //   OnlyOnePointerRecognizer.instance.setIsEnableMultiple(isEnable: true);
  // }
  //
  // /// Disable multiple touching
  // static void disableMultipleTouching() {
  //   OnlyOnePointerRecognizer.instance.setIsEnableMultiple(isEnable: false);
  // }

  /// Dialog is show on screen.
  static bool isShowLoading() {
    return SmartDialog.config.custom.isExist;
  }
}
