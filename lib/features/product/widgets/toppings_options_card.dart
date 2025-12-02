import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constants/app_text_style.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_text.dart';

class ToppingsAndOptionsCard extends StatelessWidget {
  const ToppingsAndOptionsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children:List.generate(5, (index){
          return Padding(
            padding:  EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                Container(
                    height: 115.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                      color: Color(0xff3C2F2F),
                      borderRadius: BorderRadius.circular(20.r),
                    )
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: -4.h,
                  child: SizedBox(
                    width: 110.w,
                    height: 80.h,
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Image.asset(Assets.imagesTomatotest),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w, vertical: 5.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: 'Tomato', textStyle: textStyle.semiBold16.copyWith(color: Colors.white)),
                        InkWell(onTap: (){},
                          child: CircleAvatar(
                            radius: 10.r,
                            backgroundColor: Colors.white,
                            child: Icon(CupertinoIcons.add, color: Colors.black, size: 20.sp,),

                          ),
                        )
                      ],),
                  ),
                ),

              ],
            ),
          );

        }),
      ),
    );
  }
}
