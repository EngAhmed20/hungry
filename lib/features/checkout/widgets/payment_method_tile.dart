import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_text_style.dart';
import '../../../shared/custom_text.dart';

ListTile paymentMethodTile({
  void Function()? onTap,
  required String title,
  String? subtitle,
  required String value,
  required String groupValue,
  Color? tileColor,
  required String leadingImg,
  Widget? trailing,


}) {
  return ListTile(

    tileColor:tileColor?? Colors.grey.shade700,
    onTap: onTap,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
    title: Center(
      child: Column(
        children: [
          CustomText(text:title, textStyle: textStyle.bold18.copyWith(
              color: Colors.white
          )),
          if(subtitle!=null)
            CustomText(text: subtitle, textStyle: textStyle.semiBold13.copyWith(
                color: Colors.grey
            )),
        ],
      ),
    ),

    leading: Image.asset(leadingImg),
    trailing:trailing?? Radio(
      activeColor: Colors.white,
      value: value, groupValue:groupValue,onChanged: (v) => onTap?.call(),

    ),

  );
}
