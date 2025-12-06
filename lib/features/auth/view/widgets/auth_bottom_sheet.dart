import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import 'have_not_acc.dart';

Container authBottomSheet(BuildContext context,{required String text1,required String text2,required void Function() onTap } ) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 15.h),
    decoration: BoxDecoration(
        color: AppColors.primaryColor
    ),
    child:HaveOrNotHaveAcc(text1: text1, text2:text2, onTap:onTap),
  );
}
