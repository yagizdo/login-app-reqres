import 'package:login_app_riverpod/utils/app_colors.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
  AppTextStyle._();

  // Home View
  static TextStyle homeText() {
    return const TextStyle(
      color: AppColors.blackBackground,
      fontSize: 22,
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

}
