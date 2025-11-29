import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/constants/app_text_style.dart';

class HaveOrNotHaveAcc extends StatelessWidget {
  const HaveOrNotHaveAcc({super.key, required this.text1, required this.text2,required this.onTap});
  final String text1;
  final String text2;
  final  void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text1,
            style: textStyle.semiBold14.copyWith(
              color: Colors.white,
            )),
        Gap(5.h),
        InkWell(
          onTap:onTap,
          child: Text(text2,
              style: textStyle.semiBold16.copyWith(
                color: Colors.yellowAccent,
              )),
        ),


      ],
    );
  }
}