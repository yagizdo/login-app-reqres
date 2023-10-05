import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:login_app_riverpod/utils/app_assets.dart';
import 'package:login_app_riverpod/utils/app_constants.dart';
import 'package:login_app_riverpod/utils/app_routes.dart';
import 'package:login_app_riverpod/utils/app_textstyles.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';
import 'package:login_app_riverpod/views/auth/controller/auth_controller.dart';
import 'package:login_app_riverpod/views/auth/widgets/auth_textfield.dart';
import 'package:login_app_riverpod/widgets/main_widgets/main_layout.dart';
import 'package:login_app_riverpod/widgets/main_widgets/tap_wrapper.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_colors.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final AuthController _authController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _authController = context.read<AuthController>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainLayout(content: _buildBody());
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Login",
          style: AppTextStyle.homeText(context),
        ),
        height10Per(context: context),
        AuthTextField(hint: "Email", controller: _emailController),
        height5Per(context: context),
        AuthTextField(hint: "Password", controller: _passwordController, obscureText: true, suffixIcon: AppAssets.eyeCloseIcon,),
        height15Per(context: context),
        _loginButton(),
      ],
    );
  }

  Widget _loginButton() {
    return TapWrapper(
        onTap: () {
          _authController.userLogin(
              email: _emailController.text, password: _passwordController.text, onSuccess: (){
                context.go(AppRoutes.home);
          });
        },
        child: Container(
          height: context.screenWidth * 0.12,
          width: context.screenWidth * 0.8,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              "Login",
              style: AppTextStyle.authLoginBtnTxt(context),
            ),
          )
        ));
  }
}
