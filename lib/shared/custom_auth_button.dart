import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/constants/app_text_style.dart';
import 'custom_text.dart';

class CustomAuthButton extends StatelessWidget {
  const CustomAuthButton({
    super.key, this.onTap, required this.text,this.isLoading = true,
  }) ;
  final void Function()? onTap;
  final String text;
  final bool? isLoading;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Center(

          child: isLoading!?CircularProgressIndicator(color: AppColors.primaryColor,) :CustomText(text: text, textStyle: textStyle.bold19.copyWith(color: AppColors.primaryColor)),
        ),
      ),
    );
  }
}
