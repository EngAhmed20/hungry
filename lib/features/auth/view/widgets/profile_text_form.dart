import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

TextFormField profileTextForm(TextEditingController nameController,{required String label,
  TextInputType? keyboardType,String? Function(String?)? validator}) {
  return TextFormField(
    controller: nameController,
    cursorHeight: 15.h,
    cursorColor: Colors.white,
    keyboardType:keyboardType ,
    validator: validator,

    style: TextStyle(color: Colors.white,fontSize: 18.sp),
    decoration: InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal:18.w,vertical: 8.h),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(
          color: Colors.white,
          width: 2.w,
        ),
      ),
      fillColor: AppColors.primaryColor,
      filled: true,
      label: Text(label,style: TextStyle(color: Colors.white,fontSize: 14.sp)),
    ),
  );
}