import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double getHeight(double ratio) => MediaQuery.sizeOf(this).height * ratio;
  double getWidth(double ratio) => MediaQuery.sizeOf(this).width * ratio;

  Size get size => MediaQuery.sizeOf(this);

  double get screenWidth => MediaQuery.sizeOf(this).width;

  double get height => MediaQuery.sizeOf(this).height;

  double get shortestSide =>
      MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
          .size
          .shortestSide;

  bool get isIpad =>
      MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
          .size
          .shortestSide >
          600;

  bool get isLittlePhone =>
      MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
          .size
          .shortestSide <
      390;

  bool get isAndroidPhone => Platform.isAndroid;

  bool get isBigAndroidPhone =>
      MediaQueryData.fromView(PlatformDispatcher.instance.views.first)
          .size
          .shortestSide >
      390;
}
