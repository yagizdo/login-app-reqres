import 'package:flutter/material.dart';
import 'package:login_app_riverpod/utils/app_constants.dart';
import 'package:login_app_riverpod/utils/app_textstyles.dart';
import 'package:login_app_riverpod/views/auth/controller/auth_controller.dart';
import 'package:login_app_riverpod/views/auth/widgets/auth_textfield.dart';
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
    return _buildBody();
  }

  Widget _buildBody() {
    return Column(
      children: [
        Text(
          "Login",
          style: AppTextStyle.homeText(),
        ),
        height10Per(context: context),
        AuthTextField(hint: "Email", controller: _emailController),
        height5Per(context: context),
        AuthTextField(hint: "Password", controller: _passwordController),
        height5Per(context: context),
        _loginButton(),
      ],
    );
  }

  Widget _loginButton() {
    return TapWrapper(
        onTap: () {
          _authController.userLogin(
              email: _emailController.text, password: _passwordController.text);
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(10),
          ),
        ));
  }
}
