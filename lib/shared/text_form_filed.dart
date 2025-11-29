import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/constants/app_colors.dart';
import '../core/utils/validators.dart';

class CustomTextFormFiled extends StatefulWidget {
  const CustomTextFormFiled({
    super.key, required this.hintText, required this.controller,  this.isPass = false,
  });
  final String hintText ;
  final TextEditingController controller;
   final bool isPass;

  @override
  State<CustomTextFormFiled> createState() => _CustomTextFormFiledState();
}

class _CustomTextFormFiledState extends State<CustomTextFormFiled> {
  late bool _obscure;
  @override
  void initState() {
    setState(() {
      _obscure = widget.isPass;
    });
    super.initState();
  }
  toggleObscure(){
    setState(() {
      _obscure = !_obscure;
    });
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.primary,
      controller: widget.controller,
      obscureText: _obscure,
      validator: (value){
        if (widget.hintText.toLowerCase() == "email") {
          return AppValidators.email(value);
        }

        if (widget.hintText.toLowerCase() == "password") {
          return AppValidators.password(value);
        }else{
          return AppValidators.defaultValidator(value);
        }


      },
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        suffixIcon: widget.isPass? GestureDetector(
            onTap: toggleObscure,
            child:_obscure? Icon(Icons.visibility_off): Icon(Icons.visibility)):null,
        hintText: widget.hintText,
        filled: true,
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
