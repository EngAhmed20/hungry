import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';

Container bottomNavBar({void Function(int)? onTap, required int index}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 5.h),
    decoration: BoxDecoration(
      color: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,

      backgroundColor: Colors.transparent,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withValues(alpha: 0.5),
      selectedFontSize: 13.sp,
      unselectedFontSize: 12.sp,
      elevation: 0,
      selectedIconTheme: IconThemeData(size: 24.sp),
      unselectedIconTheme: IconThemeData(size: 20.sp),
      currentIndex: index,
      items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart),label: 'Cart'),
        BottomNavigationBarItem(icon: Icon(Icons.local_restaurant_outlined),label: 'Orders History'),
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.person),label: 'Profile'),
      ],
      onTap: onTap,

    ),
  );
}
