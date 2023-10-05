import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_settings_provider.dart';
import '../../../utils/app_textstyles.dart';
import '../../../widgets/main_widgets/tap_wrapper.dart';

class AuthTextField extends StatefulWidget {
  const AuthTextField(
      {super.key,
        required this.hint,
        this.suffixIcon,
        this.obscureText = false,
        required this.controller});

  final String hint;
  final String? suffixIcon;
  final bool obscureText;
  final TextEditingController controller;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool _showPassword = false;
  @override
  Widget build(BuildContext context) {
    final appSettingsProvider = context.read<AppSettingsProvider>();
    return Padding(
      padding: EdgeInsets.only(right: context.screenWidth * 0.05),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText ? !_showPassword : false,
        onTap: () {
          appSettingsProvider.setKeyboardOpen(true);
        },
        onSubmitted: (value) {
          appSettingsProvider.setKeyboardOpen(false);
          FocusScope.of(context).unfocus();
        },
        onTapOutside: (value) {
          appSettingsProvider.setKeyboardOpen(false);
          FocusScope.of(context).unfocus();
        },
        decoration: InputDecoration(
          hintText: widget.hint,
          filled: true,
          suffixIcon: widget.suffixIcon != null
              ? Padding(
            padding: EdgeInsets.only(right: context.screenWidth * 0.05),
            child: !widget.obscureText ? SvgPicture.asset(
              widget.suffixIcon!,
              width: context.screenWidth * 0.03,
              height: context.screenWidth * 0.03,
            ) : TapWrapper(
              onTap: () {
                setState(() {
                  _showPassword = !_showPassword;
                });
              },
              child: SvgPicture.asset(
                _showPassword ? AppAssets.eyeOpenIcon : AppAssets.eyeCloseIcon,
                width: context.screenWidth * 0.03,
                height: context.screenWidth * 0.03,
              ),
            ),
          )
              : null,
          fillColor: Colors.grey,
          hintStyle: AppTextStyle.authTextFieldHint(context),
          contentPadding: EdgeInsets.symmetric(
              horizontal: context.screenWidth * 0.05,
              vertical: context.screenWidth * 0.05),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
