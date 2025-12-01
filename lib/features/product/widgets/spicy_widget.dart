import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_text.dart';

class SpicySlider extends StatelessWidget {
  const SpicySlider({
    super.key, this.onChanged, required this.sliderValue,
  });
  final void Function(double)?onChanged;
  final double sliderValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(Assets.imagesSandwichDetails,height: 200.h,),
        Spacer(),
        Column(
          children: [
            CustomText(text: 'Customize Your Burger\n to Your Tastes.\n Ultimate Experience', textStyle: textStyle.bold16),
            Gap(10.h),
            SizedBox(
              width: 140.w,
              child: Slider(value: sliderValue, onChanged:onChanged,
                max: 2,
                min: 0,
                padding: EdgeInsets.zero,
                activeColor: AppColors.primaryColor,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                CustomText(text:'🥶', textStyle: textStyle.bold16),
                Gap(130.w),
                CustomText(text:'🌶️', textStyle: textStyle.bold16),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
