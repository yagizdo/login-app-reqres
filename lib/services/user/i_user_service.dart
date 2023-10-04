import 'package:login_app_riverpod/models/user/user.dart';

abstract class IUserService {
  Future<List<User>?> getUsers();
}