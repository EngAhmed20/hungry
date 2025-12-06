import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/constants/app_text_style.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_auth_button.dart';
import '../../../shared/text_form_filed.dart';
import 'widgets/auth_bottom_sheet.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const String routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Gap(150.h),
              SvgPicture.asset(Assets.imagesLogo,color: AppColors.primaryColor,),
              Gap(10.h),
              CustomText(text: 'Join us and order your favorite meals',
                  textStyle:textStyle.bold18),
              Gap(40.h),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.r),
                      topRight: Radius.circular(30.r),
                    )
                  ),
                  padding: AppDimens.scrPadding(v: 30.h),
                  child: SingleChildScrollView(
                    keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(children: [

                      CustomTextFormFiled(hintText: 'Name',controller: nameController,),
                      Gap(20.h),
                      CustomTextFormFiled(hintText: 'Email',controller: emailController,),
                      Gap(20.h),
                      CustomTextFormFiled(hintText: 'Password',controller: passwordController,isPass: true,),
                      Gap(20.h),
                      CustomTextFormFiled(hintText: 'Confirm Password',controller: confirmPasswordController,isPass: true,passwordController: passwordController,),
                      Gap(30.h),

                      CustomAuthButton(
                        text: 'Sign Up',
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            // Perform sign-up logic here
                          }
                        },
                      ),
                    ],),
                  ),
                ),
              ),
            ],

          ),

        ),
        bottomSheet: authBottomSheet(context, text1: 'Already a member?', text2: 'Log in', onTap: (){
          Navigator.pop(context);
        },
      ),
      )
    );
  }

}


