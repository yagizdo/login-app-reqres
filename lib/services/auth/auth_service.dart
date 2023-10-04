import 'package:dio/dio.dart';
import 'package:login_app_riverpod/services/auth/i_auth_service.dart';
import 'package:login_app_riverpod/services/core/api_client.dart';

class AuthService extends ApiClient implements IAuthService {
  @override
  Future<void> login(String email, String password) async {
    try {
      final Response response = await dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
    } on DioException catch (e) {
      if (e.response != null) {
        navigationService.showErrorSnackbar(errorMessage: e.response?.data['error'] ?? 'Something went wrong');
      }
    } catch (e) {
      navigationService.showErrorSnackbar(errorMessage: 'Something went wrong');
    }
  }

  @override
  Future<void> logout() async {}

}