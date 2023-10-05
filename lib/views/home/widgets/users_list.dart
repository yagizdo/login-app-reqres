import 'package:flutter/material.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

import '../../../models/user/user.dart';
import '../../../utils/app_colors.dart';
import '../controller/home_controller.dart';
import 'user_card.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomeController, List<User>?>(
        selector: (context, homeController) => homeController.users,
        builder: (context, users, child) {
          return ListView.builder(
            itemCount: users?.length ?? 0,
            itemBuilder: (context, index) {
              return UserCard(
                user: users?[index],
              );
            },
          );
        }
    );
  }
}
