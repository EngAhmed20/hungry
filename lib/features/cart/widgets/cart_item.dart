import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key, required this.name, required this.desc, required this.imageUrl, required this.quantity, this.onAdd, this.onRemove, this.removeItem,
  });
  final String name;
  final String desc;
  final String imageUrl;
  final int quantity;
  final void Function()? onAdd;
  final void Function()? onRemove;
  final void Function()? removeItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(Assets.imagesTest,height: 100.h,),
                Gap(10.h),
                CustomText(text: 'Hamburger', textStyle: textStyle.semiBold16),
                CustomText(text: 'Veggie Burger', textStyle: textStyle.regular16),


              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                        onTap: onRemove,
                        child: CircleAvatar(radius: 15.r,child: Icon(CupertinoIcons.minus,color: Colors.white,),backgroundColor: AppColors.primaryColor,)),
                    Gap(15.w),
                    CustomText(text:'$quantity', textStyle: textStyle.bold16),
                    Gap(15.w),
                    GestureDetector(
                        onTap: onAdd,
                        child: CircleAvatar(radius: 15.r,child: Icon(CupertinoIcons.add,color: Colors.white,),backgroundColor: AppColors.primaryColor,)),
                  ],
                ),
                Gap(30.h),
                customButton(text: 'Remove', onTap:removeItem,
                  horizontalPadding: 10,
                  verticalPadding: 5,
                ),


              ],
            ),


          ],
        ),
      ),
    );
  }
}
