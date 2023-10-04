import 'package:login_app_riverpod/utils/app_textstyles.dart';
import 'package:login_app_riverpod/widgets/main_widgets/main_layout.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Center(
        child: Text(
          'Home',
          style: AppTextStyle.homeText(),
        ),
      ),
    );
  }
}
