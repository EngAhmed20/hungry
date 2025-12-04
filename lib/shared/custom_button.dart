import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_style.dart';
import 'custom_text.dart';

GestureDetector customButton({
  void Function()? onTap,
  required String text,
  double? verticalPadding,
  double? horizontalPadding,
  double? width,
}) {
  return GestureDetector(
    onTap:onTap,
    child: Container(
      width: width,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding?.w??15.w,
        vertical: verticalPadding?.h??10.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: CustomText(text:text,
          textStyle: textStyle.bold19.copyWith(color: Colors.white),
        ),
      ),
    ),
  );
}
