import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void showErrorSnackbar({required String errorMessage}) {
    SnackBar snackbar = SnackBar(
      content: SizedBox(
        height: navigatorKey.currentContext!.screenWidth * 0.1,
        child: Center(
          child: Text(
            errorMessage,
          ),
        ),
      ),
      backgroundColor: CupertinoColors.destructiveRed,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackbar);
  }

  void showSuccessSnackbar({required String successMessage}) {
    SnackBar snackbar = SnackBar(
      content: SizedBox(
        height: navigatorKey.currentContext!.screenWidth * 0.1,
        child: Center(
          child: Text(
            successMessage,
          ),
        ),
      ),
      backgroundColor: CupertinoColors.activeGreen,
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(navigatorKey.currentContext!).clearSnackBars();
    ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackbar);
  }

  void dispose() {
    navigatorKey.currentState!.dispose();
  }
}