import 'package:login_app_riverpod/utils/app_constants.dart';
import 'package:login_app_riverpod/utils/app_textstyles.dart';
import 'package:login_app_riverpod/views/home/controller/home_controller.dart';
import 'package:login_app_riverpod/views/home/widgets/users_list.dart';
import 'package:login_app_riverpod/widgets/main_widgets/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
 late final HomeController homeController ;

  @override
  void initState() {
    super.initState();
    homeController = context.read<HomeController>();
    homeController.getUsers();
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: _buildBody()
    );
  }

  Widget _buildBody() {
    return Column(
      children: [
        height5Per(context: context),
        Text("Users", style: AppTextStyle.homeText(),),
        height5Per(context: context),
        const Expanded(child: UsersList()),
      ],
    );
  }


}
