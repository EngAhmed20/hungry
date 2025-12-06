import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/features/auth/view/widgets/profile_text_button.dart';
import 'package:hungry/features/auth/view/widgets/profile_text_form.dart';
import 'package:hungry/features/checkout/widgets/payment_method_tile.dart';

import '../../../generated/assets.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

    return  GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar:AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.primaryColor,
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: Colors.white,size: 22.w,))
          ],
        ),
        body:Padding(
          padding: AppDimens.scrPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.white,width: 2.w),
                    image: DecorationImage(
                      image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png'),
                      fit: BoxFit.cover,
                    ),

                  ),

                ),
              ),
              Gap(30.h),
              profileTextForm(nameController, label: 'Name',keyboardType: TextInputType.name),
              Gap(15.h),
              profileTextForm(emailController, label: 'Email',keyboardType: TextInputType.emailAddress),
              Gap(15.h),
              profileTextForm(addressController, label: 'Address',keyboardType: TextInputType.streetAddress),
              Gap(30.h),
              paymentMethodTile(title: 'Credit Card', value: 'card', groupValue: 'card', leadingImg: Assets.imagesCreditIcon,subtitle: '**** **** **** 1234',),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                profileTextButton(text: 'Edit Profile',
                    onTap: (){},
                    icon: Icons.edit_note_outlined,
                    color: AppColors.primaryColor,
                    backgroundColor: Colors.white),
                  profileTextButton(text: 'Log Out',
                      onTap: (){},
                      icon: Icons.logout,
                      color: Colors.white,
                      backgroundColor: AppColors.primaryColor),

              ],),
            ],
          ),
        ),
      ),
    );
  }




}
