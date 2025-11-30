import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({super.key, required this.categories, required this.selectedIndex, this.onTap});
  final List<String> categories;
  final int selectedIndex;
  final void Function(int index)? onTap;


  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: ()=>onTap?.call(index),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 25.w,
                vertical: 10.h,
              ),
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                color:
                selectedIndex == index
                    ? AppColors.primaryColor
                    : Colors.grey.shade400,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Text(
                categories[index],
                style:
                selectedIndex == index
                    ? textStyle.bold16.copyWith(
                  color: Colors.white,
                )
                    : textStyle.semiBold16,
              ),
            ),
          );
        }),
      ),
    );
  }
}
