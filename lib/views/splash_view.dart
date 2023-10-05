import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app_riverpod/utils/app_constants.dart';
import 'package:login_app_riverpod/utils/app_routes.dart';
import 'package:login_app_riverpod/utils/app_textstyles.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';
import 'package:login_app_riverpod/widgets/main_widgets/main_layout.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      context.go(AppRoutes.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      content: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlutterLogo(size: context.screenWidth * 0.35),
            height5Per(context: context),
            Text("Login App", style: AppTextStyle.splashText(context)),
          ],
        ),
      ),
    );
  }
}
