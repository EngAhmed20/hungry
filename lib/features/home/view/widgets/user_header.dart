import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_text_style.dart';
import '../../../../generated/assets.dart';

class UserHeader extends StatelessWidget {
  const UserHeader({
    super.key, required this.userName, required this.userImg,
  });
  final String userName;
  final String userImg;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SvgPicture.asset(
              Assets.imagesLogo,
              height: 35,
              color: AppColors.primaryColor,
            ),
            Gap(5.h),
            Text(
              'Hello,$userName Are You Hungry Today?',
              style: textStyle.bold13.copyWith(
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
        CircleAvatar(radius: 30.r,backgroundImage:NetworkImage(userImg),),
      ],
    );
  }
}
