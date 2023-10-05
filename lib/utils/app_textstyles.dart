import 'package:login_app_riverpod/utils/app_colors.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  // Splash Text
  static TextStyle splashText(BuildContext context) {
    return TextStyle(
      color: AppColors.blackBackground,
      fontSize: context.screenWidth * 0.075,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      overflow: TextOverflow.ellipsis,
    );
  }

  // Home View
  static TextStyle homeText(BuildContext context) {
    return TextStyle(
      color: AppColors.blackBackground,
      fontSize: context.screenWidth * 0.06,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle homeUserCardNameAndSurname(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: context.screenWidth * 0.045,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle homeUserCardEmail(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: context.screenWidth * 0.04,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.2,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle errorTitleText(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: context.screenWidth * 0.05,
      fontWeight: FontWeight.w700,
      //letterSpacing: -0.2,
      //overflow: TextOverflow.ellipsis,
    );
  }

  // No Internet Connection View
  static TextStyle noInternetConnectionView(BuildContext context) {
    return TextStyle(
      color: Colors.white,
      fontSize: context.isLittlePhone ? context.screenWidth * 0.04 : context.screenWidth * 0.045,
      //overflow: TextOverflow.ellipsis,
    );
  }

  // Auth
  static TextStyle authTextFieldHint(BuildContext context) {
    return TextStyle(
      color: AppColors.greyTxt,
      fontSize: context.screenWidth * 0.04,
      fontWeight: FontWeight.w400,
    );
  }
  static TextStyle authLoginBtnTxt(BuildContext context) {
    return TextStyle(
      color: AppColors.white,
      fontSize: context.screenWidth * 0.04,
      fontWeight: FontWeight.w400,
    );
  }

}
