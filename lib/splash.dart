import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/root.dart';
import 'generated/assets.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});
  static const String routeName = '/splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  double _opacity = 0.0;
  double _scale = 0.5;

  @override
  void initState() {
    super.initState();

    /// start animation after first frame
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1.0;
        _scale = 1.0;
      });
    });

    /// navigate
    executeNavigation(context);
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

            /// Fade + Scale animation
            AnimatedOpacity(
              duration: const Duration(milliseconds: 800),
              opacity: _opacity,
              curve: Curves.easeOut,
              child: AnimatedScale(
                scale: _scale,
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeOutBack,
                child: SvgPicture.asset(Assets.imagesLogo),
              ),
            ),

            const Spacer(),

            AnimatedOpacity(
                duration: const Duration(milliseconds: 800),
                opacity: _opacity,
                curve: Curves.easeOut,

                child: AnimatedScale(
                    scale: _scale,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.easeOutBack,
                    child: Image.asset(Assets.imagesSplash))),
          ],
        ),
      ),
    );
  }

  void executeNavigation(context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        Root.routeName,
            (route) => false,
      );
    });
  }
}
