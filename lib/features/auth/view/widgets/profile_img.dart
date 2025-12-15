import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

Stack profileImg({ImageProvider<Object>? backgroundImage,void Function(Object, StackTrace?)? onBackgroundImageError,
  void Function()? pickProfileImg} ) {
  return Stack(
    children: [
      CircleAvatar(
        radius: 50.w,
        backgroundColor: Colors.white,
        backgroundImage:backgroundImage,
        onBackgroundImageError: onBackgroundImageError,
      ),
      Positioned(
        bottom: 0,
        right: 0,
        child: GestureDetector(
          onTap: pickProfileImg,
          child: CircleAvatar(
            radius: 15.w,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              CupertinoIcons.camera_fill,
              color: Colors.white,
              size: 16.w,
            ),
          ),
        ),
      ),
    ],
  );
}
