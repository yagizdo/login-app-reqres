import 'package:dio/dio.dart';
import 'package:login_app_riverpod/models/user/user.dart';
import 'package:login_app_riverpod/services/core/api_client.dart';
import 'package:login_app_riverpod/services/user/i_user_service.dart';

class UserService extends ApiClient implements IUserService {
  @override
  Future<List<User>?> getUsers() async {
    List<User>? users;
    try {
      final Response response = await dio.get('/users');

      if (response.statusCode == 200) {
        if (response.data != null) {
          users = (response.data as List).map((e) => User.fromJson(e)).toList();
          return users;
        }
      }
      return users;
    } on DioException catch (e) {
      if (e.response != null) {
        navigationService.showErrorSnackbar(errorMessage: e.response?.data['error'] ?? 'Something went wrong');
      }
    } catch (e) {
      navigationService.showErrorSnackbar(errorMessage: 'Something went wrong');
    }
    return users;
  }

}