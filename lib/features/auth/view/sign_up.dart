import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/constants/app_text_style.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../generated/assets.dart';
import '../../../root.dart';
import '../../../shared/custom_auth_button.dart';
import '../../../shared/custom_snack_bar.dart';
import '../../../shared/text_form_filed.dart';
import '../data/auth_repo.dart';
import 'widgets/auth_bottom_sheet.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key, required this.authRepo});
  static const String routeName = '/signup';
  final AuthRepo authRepo;


  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  registerFun()async{
    setState(() {
      isLoading = true;
    });
    final result=await widget.authRepo.register(name: nameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim());

    result.fold((failure){
      setState(() {

        isLoading = false;
      });
      customSnackBar(context: context, msg: failure.message,isErr: true);
    }, (success){
      setState(() {
        isLoading = false;
      });
      customSnackBar(context: context, msg: 'Registered Successfully',isErr: false);
      Navigator.pushNamedAndRemoveUntil(context, Root.routeName, (route) => false);

    });  }

  @override
  Widget build(BuildContext context) {

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
                        text: 'Sign Up',isLoading: isLoading,
                        onTap: (){
                          if(_formKey.currentState!.validate()){
                            registerFun();
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


