import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/style/app_colors.dart';
import '../../core/style/app_text_style.dart';

/// {@template app_alert_dialog_widget}
/// [AppAlertDialogWidget] returns a state less widget
///
/// [AppAlertDialogWidget] to show dialog in app (above all of screen)
/// {@endtemplate}
class AppAlertDialogWidget extends StatelessWidget {
  /// {@macro app_alert_dialog_widget}
  const AppAlertDialogWidget({
    super.key,
    this.title,
    required this.content,
    required this.image,
    required this.labelCancel,
    required this.onPressCancel,
    this.labelConfirm,
    this.onPressConfirm,
    this.borderRadius = 14,
    this.backgroundColor,
    this.colorBorderSide,
  });

  /// Message title dialog
  final String? title;

  /// Not null, Message content dialog
  final String content;

  /// Not null, Image content dialog
  final String image;

  /// Not null, Label of button cancel dialog
  final String labelCancel;

  /// Not null, Action of button cancel dialog
  final VoidCallback onPressCancel;

  /// Label of button confirm dialog
  final String? labelConfirm;

  /// Action of button confirm dialog
  final VoidCallback? onPressConfirm;

  /// Not null, Value of border radius dialog
  final double borderRadius;

  /// Value of background color dialog
  final Color? backgroundColor;

  /// Value of color border side dialog
  final Color? colorBorderSide;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColors.whiteColor,
      surfaceTintColor: AppColors.transparent,
      contentPadding: const EdgeInsets.all(16),
      actionsPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        side: BorderSide(
          color: colorBorderSide ?? AppColors.secondaryColor,
        ),
      ),
      titleTextStyle:
      AppTextStyle.bold16.copyWith(color: AppColors.headingColor),
      content: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 54.h, minWidth: 300.w),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 64.w,
              height: 64.w,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 4.w),
            Flexible(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (title != null)
                    Text(
                      title!,
                      textAlign: TextAlign.left,
                      style: AppTextStyle.bold16
                          .copyWith(color: AppColors.headingColor),
                    ),
                  Text(
                    content,
                    textAlign: TextAlign.left,
                    style: AppTextStyle.regular14
                        .copyWith(color: AppColors.headingColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buttonDialog(
              label: labelCancel,
              textStyle:
              AppTextStyle.regular14.copyWith(color: AppColors.whiteColor),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(borderRadius),
                bottomRight: labelConfirm == null
                    ? Radius.circular(borderRadius)
                    : const Radius.circular(0),
              ),
              onPress: onPressCancel,
            ),
            if (labelConfirm != null && onPressConfirm != null) ...{
              SizedBox(
                width: 1,
                child: Container(
                  color: backgroundColor ?? AppColors.whiteColor,
                ),
              ),
              _buttonDialog(
                label: labelConfirm!,
                textStyle: AppTextStyle.regular14
                    .copyWith(color: AppColors.whiteColor),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(borderRadius),
                ),
                onPress: onPressConfirm!,
              ),
            },
          ],
        )
      ],
    );
  }

  Widget _buttonDialog({
    required String label,
    TextStyle? textStyle,
    BorderRadiusGeometry borderRadius = const BorderRadius.all(
      Radius.circular(16),
    ),
    required VoidCallback onPress,
  }) =>
      Flexible(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            foregroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          onPressed: () {
            Future.delayed(const Duration(milliseconds: 250), () {
              onPress();
            });
          },
          child: Text(
            label,
            style: textStyle,
          ),
        ),
      );
}
