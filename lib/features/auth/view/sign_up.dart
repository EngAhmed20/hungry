import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/view/widgets/have_not_acc.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_button.dart';
import '../../../shared/text_form_filed.dart';

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
        backgroundColor: AppColors.primaryColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(60.h),
                SvgPicture.asset(Assets.imagesLogo),
                Gap(40.h),
                CustomTextFormFiled(hintText: 'Name',controller: nameController,),
                Gap(20.h),
                CustomTextFormFiled(hintText: 'Email',controller: emailController,),
                Gap(20.h),
                CustomTextFormFiled(hintText: 'Password',controller: passwordController,isPass: true,),
                Gap(20.h),
                CustomTextFormFiled(hintText: 'Confirm Password',controller: confirmPasswordController,isPass: true,passwordController: passwordController,),
                Gap(30.h),

                CustomButton(
                  text: 'Sign Up',
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      // Perform sign-up logic here
                    }
                  },
                ),
                Spacer(),
                HaveOrNotHaveAcc(text1: 'Already a member?', text2: 'Log in', onTap: (){
                  Navigator.pop(context);
                }),
                Gap(20.h),
              ],

            ),
          ),
        ),
      ),
    );
  }
}


