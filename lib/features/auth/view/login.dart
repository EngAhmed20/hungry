import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/view/sign_up.dart';
import 'package:hungry/features/auth/view/widgets/auth_bottom_sheet.dart';
import 'package:hungry/root.dart';
import 'package:hungry/shared/custom_auth_button.dart';
import 'package:hungry/shared/custom_snack_bar.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_style.dart';
import '../../../generated/assets.dart';
import '../../../shared/text_form_filed.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key, required this.authRepo});
  static const String routeName = '/login';
  final AuthRepo authRepo;

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   bool isLoading = false;
   @override
  void initState() {
    emailController.text='ahmed7@gmail.com';
    passwordController.text='123456789';
    super.initState();
  }
  Future<void> loginFun()async{
    setState(() {
      isLoading = true;
    });

    final result= await widget.authRepo.login(
        email: emailController.text.trim(),
        password: passwordController.text.trim()
    );
    result.fold((failure){
      setState(() {

        isLoading = false;
      });
      customSnackBar(context: context, msg: failure.message,isErr: true);
    }, (success){
      setState(() {
        isLoading = false;
      });
      customSnackBar(context: context, msg: 'Welcome back! You’re logged in',isErr: false);
       Navigator.pushNamedAndRemoveUntil(context, Root.routeName, (route) => false);

    });


  }
  @override
  Widget build(BuildContext context) {


    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(150.h),
              SvgPicture.asset(Assets.imagesLogo,color: AppColors.primaryColor,),
              Gap(10.h),
              Padding(
                padding:EdgeInsets.symmetric(horizontal: 10.w),
                child: CustomText(text: 'Welcome back!\nDiscover delicious fast food.', textStyle: textStyle.bold18),
              ),
              Gap(40.h),
              Expanded(
                child: Container(
                  padding: AppDimens.scrPadding(v: 30.h),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: SingleChildScrollView(
                    keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                    child: Column(
                      children: [
                        CustomTextFormFiled(hintText: 'Email',controller: emailController,),
                        Gap(20.h),
                        CustomTextFormFiled(hintText: 'Password',controller: passwordController,isPass: true,),
                        Gap(10.h),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CustomText(text: 'Forgot Password?', textStyle: textStyle.semiBold13.copyWith(color: Colors.white)),
                        ),
                        Gap(20.h),

                        CustomAuthButton(text: 'Login',isLoading: isLoading, onTap: ()async{
                          if(_formKey.currentState!.validate()){

                            await loginFun();
                          }
                        },),
                      ],
                    ),
                  ),
                ),
              )

            ],

          ),
        ),
        bottomSheet: authBottomSheet(context, text1: 'Don\'t have an account?', text2: 'Register now',
            onTap: (){
          Navigator.pushNamed(context, SignUpView.routeName);
            }),
      ),
    );
  }
}

