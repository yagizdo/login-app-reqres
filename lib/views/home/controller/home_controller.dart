import 'package:flutter/cupertino.dart';
import 'package:login_app_riverpod/services/user/user_service.dart';
import 'package:login_app_riverpod/utils/app_locator.dart';

import '../../../models/user/user.dart';

class HomeController extends ChangeNotifier {
  UserService userService = getIt<UserService>();

  List<User>? users;

  Future<void> getUsers() async {
    users = await userService.getUsers();
    notifyListeners();
  }
}
