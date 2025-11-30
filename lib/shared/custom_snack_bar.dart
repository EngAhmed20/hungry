import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/constants/app_colors.dart';
import '../core/constants/app_text_style.dart';

void customSnackBar({required BuildContext context, required String msg,IconData?iconMsg,Color?iconColor,bool isErr=false}) {
  final IconData finalIcon;

  if(iconMsg!=null){
    finalIcon=iconMsg;}
  else{
    finalIcon=isErr?Icons.error_outlined:Icons.check_circle_outline;
  }
  final Color finalIconColor;

  if (iconColor != null) {
    finalIconColor = iconColor; // لو بعت لون → استخدمه
  } else {
    finalIconColor = isErr ? Colors.redAccent : Colors.white;
  }

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              msg,
              style: textStyle.semiBold16,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(width: 10,),
          Icon(finalIcon,color:finalIconColor,size: 25,),
        ],
      ),
      margin:  EdgeInsets.symmetric(vertical: 20.h, horizontal: 5.w),
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
        side: BorderSide(
          color: isErr ? Colors.redAccent : Colors.white,
          width: 1.5,
        ),

      ),



      elevation: 10,
      backgroundColor: AppColors.lightPrimaryColor,
    ),
  );
}