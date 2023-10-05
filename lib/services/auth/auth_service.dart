import 'package:dio/dio.dart';
import 'package:login_app_riverpod/models/login/login_response_model.dart';
import 'package:login_app_riverpod/services/auth/i_auth_service.dart';
import 'package:login_app_riverpod/services/core/api_client.dart';
import 'package:login_app_riverpod/services/core/cache_manager.dart';
import 'package:login_app_riverpod/utils/app_locator.dart';

class AuthService extends ApiClient implements IAuthService {

  final CacheManager _cacheManager = getIt<CacheManager>();
  @override
  Future<void> login(String email, String password, Function()? onSuccess) async {
    try {
      final Response response = await dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        LoginResponseModel loginResponseModel = LoginResponseModel.fromJson(response.data);
        await _cacheManager.saveToken(loginResponseModel.token ?? 'No token data');
        onSuccess?.call();
      }
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