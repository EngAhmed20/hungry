import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/custom_text.dart';

class OrderHistoryItem extends StatelessWidget {
  const OrderHistoryItem({
    super.key, required this.name, required this.price, required this.imageUrl, required this.quantity,this.reOrder,
  });
  final String name;
  final double price;
  final String imageUrl;
  final int quantity;
  final void Function()? reOrder;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shadowColor: Colors.grey,
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(Assets.imagesTest,height: 100.h,),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: 'Hamburger', textStyle: textStyle.semiBold16),
                    Gap(2.h),
                    CustomText(text: 'Qty: $quantity', textStyle: textStyle.semiBold16),
                    Gap(2.h),
                    CustomText(text: 'Price: $price\$', textStyle: textStyle.semiBold16),
                    //Gap(10.h),


                  ],
                ),


              ],
            ),
            customButton(text: 'Re Order', onTap:reOrder,
            ),

          ],
        ),
      ),
    );
  }
}