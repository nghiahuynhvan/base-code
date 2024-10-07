// ignore_for_file: public_member_api_docs
import 'package:flutter/material.dart';

import 'app_font_family.dart';

/// [AppTextStyle] contains various custom text style.
///
/// Type of text style:
/// 1. regular
/// 2. bold
class AppTextStyle {
  AppTextStyle._();

  // light style

  static final TextStyle light9 = lightStyle.copyWith(fontSize: 9);
  static final TextStyle light10 = lightStyle.copyWith(fontSize: 10);
  static final TextStyle light11 = lightStyle.copyWith(fontSize: 11);
  static final TextStyle light12 = lightStyle.copyWith(fontSize: 12);
  static final TextStyle light13 = lightStyle.copyWith(fontSize: 13);
  static final TextStyle light14 = lightStyle.copyWith(fontSize: 14);
  static final TextStyle light15 = lightStyle.copyWith(fontSize: 15);
  static final TextStyle light16 = lightStyle.copyWith(fontSize: 16);
  static final TextStyle light18 = lightStyle.copyWith(fontSize: 18);
  static final TextStyle light19 = lightStyle.copyWith(fontSize: 19);
  static final TextStyle light20 = lightStyle.copyWith(fontSize: 20);
  static final TextStyle light22 = lightStyle.copyWith(fontSize: 22);
  static final TextStyle light24 = lightStyle.copyWith(fontSize: 24);
  static final TextStyle light26 = lightStyle.copyWith(fontSize: 26);
  static final TextStyle light28 = lightStyle.copyWith(fontSize: 28);
  static final TextStyle light32 = lightStyle.copyWith(fontSize: 32);

  // regular style

  static final TextStyle regular9 = regularStyle.copyWith(fontSize: 9);
  static final TextStyle regular10 = regularStyle.copyWith(fontSize: 10);
  static final TextStyle regular11 = regularStyle.copyWith(fontSize: 11);
  static final TextStyle regular12 = regularStyle.copyWith(fontSize: 12);
  static final TextStyle regular13 = regularStyle.copyWith(fontSize: 13);
  static final TextStyle regular14 = regularStyle.copyWith(fontSize: 14);
  static final TextStyle regular15 = regularStyle.copyWith(fontSize: 15);
  static final TextStyle regular16 = regularStyle.copyWith(fontSize: 16);
  static final TextStyle regular18 = regularStyle.copyWith(fontSize: 18);
  static final TextStyle regular19 = regularStyle.copyWith(fontSize: 19);
  static final TextStyle regular20 = regularStyle.copyWith(fontSize: 20);
  static final TextStyle regular22 = regularStyle.copyWith(fontSize: 22);
  static final TextStyle regular24 = regularStyle.copyWith(fontSize: 24);
  static final TextStyle regular26 = regularStyle.copyWith(fontSize: 26);
  static final TextStyle regular28 = regularStyle.copyWith(fontSize: 28);
  static final TextStyle regular32 = regularStyle.copyWith(fontSize: 32);

  // medium style
  static final TextStyle medium9 = mediumStyle.copyWith(fontSize: 9);
  static final TextStyle medium10 = mediumStyle.copyWith(fontSize: 10);
  static final TextStyle medium11 = mediumStyle.copyWith(fontSize: 11);
  static final TextStyle medium12 = mediumStyle.copyWith(fontSize: 12);
  static final TextStyle medium13 = mediumStyle.copyWith(fontSize: 13);
  static final TextStyle medium14 = mediumStyle.copyWith(fontSize: 14);
  static final TextStyle medium15 = mediumStyle.copyWith(fontSize: 15);
  static final TextStyle medium16 = mediumStyle.copyWith(fontSize: 16);
  static final TextStyle medium18 = mediumStyle.copyWith(fontSize: 18);
  static final TextStyle medium19 = mediumStyle.copyWith(fontSize: 19);
  static final TextStyle medium20 = mediumStyle.copyWith(fontSize: 20);
  static final TextStyle medium22 = mediumStyle.copyWith(fontSize: 22);
  static final TextStyle medium24 = mediumStyle.copyWith(fontSize: 24);
  static final TextStyle medium26 = mediumStyle.copyWith(fontSize: 26);
  static final TextStyle medium28 = mediumStyle.copyWith(fontSize: 28);
  static final TextStyle medium32 = mediumStyle.copyWith(fontSize: 32);

  // semi bold style
  static final TextStyle semiBold9 = semiBoldStyle.copyWith(fontSize: 9);
  static final TextStyle semiBold10 = semiBoldStyle.copyWith(fontSize: 10);
  static final TextStyle semiBold11 = semiBoldStyle.copyWith(fontSize: 11);
  static final TextStyle semiBold12 = semiBoldStyle.copyWith(fontSize: 12);
  static final TextStyle semiBold13 = semiBoldStyle.copyWith(fontSize: 13);
  static final TextStyle semiBold14 = semiBoldStyle.copyWith(fontSize: 14);
  static final TextStyle semiBold15 = semiBoldStyle.copyWith(fontSize: 15);
  static final TextStyle semiBold16 = semiBoldStyle.copyWith(fontSize: 16);
  static final TextStyle semiBold18 = semiBoldStyle.copyWith(fontSize: 18);
  static final TextStyle semiBold19 = semiBoldStyle.copyWith(fontSize: 19);
  static final TextStyle semiBold20 = semiBoldStyle.copyWith(fontSize: 20);
  static final TextStyle semiBold22 = semiBoldStyle.copyWith(fontSize: 22);
  static final TextStyle semiBold24 = semiBoldStyle.copyWith(fontSize: 24);
  static final TextStyle semiBold26 = semiBoldStyle.copyWith(fontSize: 26);
  static final TextStyle semiBold28 = semiBoldStyle.copyWith(fontSize: 28);
  static final TextStyle semiBold32 = semiBoldStyle.copyWith(fontSize: 32);

  // bold style
  static final TextStyle bold9 = boldStyle.copyWith(fontSize: 9);
  static final TextStyle bold10 = boldStyle.copyWith(fontSize: 10);
  static final TextStyle bold11 = boldStyle.copyWith(fontSize: 11);
  static final TextStyle bold12 = boldStyle.copyWith(fontSize: 12);
  static final TextStyle bold13 = boldStyle.copyWith(fontSize: 13);
  static final TextStyle bold14 = boldStyle.copyWith(fontSize: 14);
  static final TextStyle bold15 = boldStyle.copyWith(fontSize: 15);
  static final TextStyle bold16 = boldStyle.copyWith(fontSize: 16);
  static final TextStyle bold18 = boldStyle.copyWith(fontSize: 18);
  static final TextStyle bold19 = boldStyle.copyWith(fontSize: 19);
  static final TextStyle bold20 = boldStyle.copyWith(fontSize: 20);
  static final TextStyle bold22 = boldStyle.copyWith(fontSize: 22);
  static final TextStyle bold24 = boldStyle.copyWith(fontSize: 24);
  static final TextStyle bold26 = boldStyle.copyWith(fontSize: 26);
  static final TextStyle bold28 = boldStyle.copyWith(fontSize: 28);
  static final TextStyle bold32 = boldStyle.copyWith(fontSize: 32);

  // extrabold style
  static final TextStyle extraBold32 = extraBoldStyle.copyWith(fontSize: 32);

  // regular style no scare
  static final TextStyle lightStyle =
  _textStyle.copyWith(fontWeight: FontWeight.w300);
  static final TextStyle regularStyle =
  _textStyle.copyWith(fontWeight: FontWeight.w400);
  static final TextStyle mediumStyle =
  _textStyle.copyWith(fontWeight: FontWeight.w500);
  static final TextStyle semiBoldStyle =
  _textStyle.copyWith(fontWeight: FontWeight.w600);
  static final TextStyle boldStyle =
  _textStyle.copyWith(fontWeight: FontWeight.w700);
  static final TextStyle extraBoldStyle =
  _textStyle.copyWith(fontWeight: FontWeight.w800);

  static final TextStyle _textStyle = TextStyle(
    fontFamily: AppFontFamily().getFontFamily(),
  );
}
