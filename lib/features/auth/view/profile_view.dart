import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/features/auth/data/user_model.dart';
import 'package:hungry/features/auth/view/widgets/profile_bottom_nav.dart';
import 'package:hungry/features/auth/view/widgets/profile_img.dart';
import 'package:hungry/features/auth/view/widgets/profile_text_form.dart';
import 'package:hungry/features/checkout/widgets/payment_method_tile.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/utils/service_locator.dart';
import '../../../generated/assets.dart';
import '../../../shared/custom_snack_bar.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final AuthRepo authRepo = getIt.get<AuthRepo>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController visaController = TextEditingController();
  UserData? userData;
  bool isLoading = false;
  bool isUpdated=false;
  String? errorMessage;
  String? profileImage;
  String? pickedImg;
  late GlobalKey<FormState> formKey;
  @override
  void initState() {
    getProfileData();
    formKey=GlobalKey<FormState>();
    super.initState();
  }

  Future<void> getProfileData() async {
    if (!mounted) return;
    setState(() {
      isLoading = true;
    });
    final result = await authRepo.getProfileData();
    result.fold(
      (failure) {
        setState(() {
          isLoading = false;
          errorMessage = failure.message;
        });
      },
      (user) {
        setState(() {
          userData = user;
          isLoading = false;
          nameController.text = user.name;
          emailController.text = user.email;
          addressController.text = user.address ?? '';
          profileImage = user.image;
          visaController.text = user.visa ?? '';
          print(profileImage);
        });
      },
    );
  }
  pickProfileImg(){
final ImagePicker picker=ImagePicker();
picker.pickImage(source: ImageSource.gallery).then((value){
  if(value!=null){
    setState(() {
      pickedImg=value.path;
    });
  }
});
  }
  updateProfileData()async{
    setState(() {
      isUpdated=true;
    });
    final result=await  authRepo.updateProfileData(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      address: addressController.text.trim(),
      visa:visaController.text.trim(),
      imgPath: pickedImg,
    );
    result.fold((failure){
      setState(() {
        isUpdated=false;
      });
      customSnackBar(context: context, msg:'Something went wrong',isErr: true);
    }, (success)async{
      customSnackBar(context: context, msg: 'Profile updated successfully',isErr: false);
      setState(() {
        isUpdated=false;
      });
      await getProfileData();
    });
  }
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: AppColors.primaryColor,
      backgroundColor: Colors.white,
      onRefresh:()async{
        await getProfileData();
      },
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.primaryColor,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.settings, color: Colors.white, size: 22.w),
              ),
            ],
          ),
          body: Padding(
            padding: AppDimens.scrPadding(),

            child: Skeletonizer(
              enabled: isLoading,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  bottom: 90.h
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      profileImg(backgroundImage:pickedImg!=null&&pickedImg!.isNotEmpty?
                      FileImage(File(pickedImg!)):profileImage != null && profileImage!.isNotEmpty
                          ? NetworkImage(profileImage!)
                          : const AssetImage(Assets.imagesUserPlaceholder) as ImageProvider,
                      onBackgroundImageError: (_, __) {
                        setState(() {
                          profileImage = null;
                        });
                      },pickProfileImg: pickProfileImg
                      ),
                      Gap(30.h),
                      profileTextForm(
                        nameController,
                        label: 'Name',
                        validator: (value){
                          return AppValidators.name(value);},
                        keyboardType: TextInputType.name,
                      ),
                      Gap(15.h),
                      profileTextForm(
                        emailController,
                        label: 'Email',
                        validator: (value){
                          return AppValidators.email(value);},
                        keyboardType: TextInputType.emailAddress,
                      ),

                      Gap(15.h),
                      profileTextForm(
                        addressController,
                        label: 'Address',
                        validator: (value){
                          return AppValidators.defaultValidator(value);},
                        keyboardType: TextInputType.streetAddress,
                      ),
                      Gap(20.h),
                      Divider(),
                      Gap(10.h),
                      visaController.text.isEmpty
                          ? profileTextForm(
                            visaController,
                            label: 'Credit Card',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(16),
                            ],
                          )
                          : paymentMethodTile(
                            title: 'Credit Card',
                            value: 'card',
                            groupValue: 'card',
                            trailing: IconButton(onPressed: (){
                              setState(() {
                                visaController.text='';
                              });
                            },
                                icon: Icon(Icons.edit,color: Colors.white,size: 20.w,)),
                            leadingImg: Assets.imagesCreditIcon,
                            subtitle:visaController.text ,
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          bottomNavigationBar: profileBottomNav(context,(){
            if(formKey.currentState!.validate()){
              updateProfileData();
            }
          },isUpdated),
        ),
      ),
    );
  }


}
