import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_colors.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,

      borderRadius: BorderRadius.circular(10.r),
      child: TextField(
        cursorHeight: 12.h,
        decoration: InputDecoration(
          hintText: 'Search ...',
          fillColor: Colors.white,
          filled: true,
          prefixIcon: Icon(
            CupertinoIcons.search,
            color: AppColors.primaryColor,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
