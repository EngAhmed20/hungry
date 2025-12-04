import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

Future<dynamic> checkoutDialog(BuildContext context) {
  return showDialog(context: context, builder:(context){
    return Dialog(
      child: Container(
          padding: AppDimens.scrPadding(),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(radius: 30.r,backgroundColor: AppColors.primaryColor,
                child: Icon(Icons.check,color: Colors.white,size: 60.r,),
              ),
              Gap(10.h),
              CustomText(text: 'Success !', textStyle: textStyle.bold19),
              Gap(5.h),
              CustomText(text: 'Your payment was successful.A receipt for this purchase has been sent to your email.',
                textStyle: textStyle.regular13.copyWith(
                    color: Color(0xffBCBBBB)),),
              Gap(10.h),
              customButton(text: 'Go Back',onTap: (){
                Navigator.pop(context);
              },width: double.infinity),
            ],
          )
      ),
    );
  });
}
