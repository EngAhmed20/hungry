import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/features/auth/view/widgets/profile_text_button.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimens.dart';
import '../login.dart';

Container profileBottomNav(
    BuildContext context, {
      void Function()? onEdit,
      bool isLoading = false,
      bool logoutLoading = false,
      void Function()? logoutFun,
    }) {
  {
    return Container(
      padding: AppDimens.scrPadding(v: 10),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        boxShadow: [
          BoxShadow(color: AppColors.lightPrimaryColor, blurRadius: 2.r),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          profileTextButton(
            text: 'Edit Profile',
            onTap: onEdit,
            isLoading: isLoading,
            icon: Icons.edit_note_outlined,
            color: AppColors.primaryColor,
            backgroundColor: Colors.white,
          ),
          profileTextButton(
            text: 'Log Out',
            onTap: logoutFun,
            isLoading: logoutLoading,
            icon: Icons.logout,
            color: Colors.white,
            backgroundColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}
