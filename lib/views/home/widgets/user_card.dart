import 'package:flutter/material.dart';
import 'package:login_app_riverpod/utils/extensions/context_extension.dart';

import '../../../models/user/user.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/app_textstyles.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key, this.user});

  final User? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenWidth * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.screenWidth * 0.04,
        vertical: context.screenWidth * 0.02,
      ),
      height: context.screenWidth * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.blackBackground,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: context.screenWidth * 0.08,
            backgroundImage: NetworkImage(user?.avatar ?? ''),
          ),
          width5Per(context: context),
          _userInfoComp(context),
        ],
      ),
    );
  }

  Widget _userInfoComp(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              user?.firstName ?? '',
              style: AppTextStyle.homeUserCardNameAndSurname(context),
            ),
            width2Per(context: context),
            Text(
              user?.lastName ?? '',
              style: AppTextStyle.homeUserCardNameAndSurname(context),
            ),
          ],
        ),
        height2Per(context: context),
        Text(
          user?.email ?? '',
          style: AppTextStyle.homeUserCardEmail(context),
        ),
      ],
    );
  }
}
