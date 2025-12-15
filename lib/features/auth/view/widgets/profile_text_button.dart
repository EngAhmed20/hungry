import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_text_style.dart';
import '../../../../shared/custom_text.dart';

GestureDetector profileTextButton({required String  text, void Function()? onTap,bool isLoading=false,
  required IconData icon,required Color color,required Color backgroundColor}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 10.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: Colors.white,
            width: 2.w,
          ),
          color: backgroundColor
      ),
      child: Row(
        children: [
          isLoading?CircularProgressIndicator():
          CustomText(text: text, textStyle: textStyle.bold19.copyWith(color:color)),
          Gap(3.w),
          Icon(icon,color:color,size: 24.w,),
        ],
      ),
    ),
  );
}