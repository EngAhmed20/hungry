import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/login.dart';

import 'generated/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    executeNavigation(context);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(250.h),
            SvgPicture.asset(Assets.imagesLogo),
            Spacer(),
            Image.asset(Assets.imagesSplash),
          ],
        ),
      ),
    );
  }

  void executeNavigation(context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(context, LoginView.routeName, (route) => false);
    });
  }
}
