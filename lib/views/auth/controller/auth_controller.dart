import 'package:flutter/cupertino.dart';
import 'package:login_app_riverpod/services/auth/auth_service.dart';
import 'package:login_app_riverpod/services/core/navigation_service.dart';
import 'package:login_app_riverpod/services/core/validator.dart';
import 'package:login_app_riverpod/utils/app_locator.dart';

class AuthController extends ChangeNotifier {
  final AuthService _authService = getIt<AuthService>();
  final NavigationService _navigationService = getIt<NavigationService>();

  Future<void> login(String email, String password) async {
    await _authService.login(email, password);
  }

  Future<void> userLogin({required String email, required String password}) async {
    if(Validator.email(email) != null) {
      _navigationService.showErrorSnackbar(errorMessage: Validator.email(email)!);
    } else if (Validator.password(password) != null) {
      _navigationService.showErrorSnackbar(errorMessage: Validator.password(password)!);
    } else {
      await login(email, password);
    }
  }
}
