import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    super.key, required this.imagePath, required this.title, required this.rating, this.onTap,
  });
  final String imagePath;
  final String title;
  final double rating;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        margin: EdgeInsets.zero,
        shadowColor: Colors.grey,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset(imagePath,height: 120.h,)),
              Gap(10.h),
              Text(title,style: textStyle.bold16,),
              Gap(5.h),
              Row(
                children: [
                  Text('⭐ $rating',style: textStyle.semiBold16.copyWith(color: AppColors.primaryColor),),
                  Spacer(),
                  Icon(CupertinoIcons.heart,color: AppColors.primaryColor,)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
