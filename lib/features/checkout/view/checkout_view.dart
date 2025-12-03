import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/constants/app_text_style.dart';
import 'package:hungry/features/checkout/widgets/success_view.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../shared/custom_button.dart';
import '../data/payment_method_model.dart';
import '../widgets/checkout_details.dart';
import '../widgets/payment_method_tile.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});
  static const String routeName='/checkout';

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  String paymentMethod='cash';
  bool checked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppDimens.scrPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(text: 'Order summary', textStyle: textStyle.bold19),
              Gap(10.h),
              CheckoutDetails(
                order: 20,
                deliveryFees: 5,
                taxes: 2,
                total: 27,
              ),
              Gap(30.h),
              CustomText(text: 'Payment Method', textStyle: textStyle.bold19),
              Gap(20.h),
              ListView.separated(itemBuilder: (context,index){
                final method = paymentMethods[index];
                return paymentMethodTile(title:method.title,subtitle:method.subtitle,
                    value:method.value, groupValue: paymentMethod,onTap: (){
                  paymentMethod=method.value;
          
          
                  setState(() {
          
                  });
                    }, leadingImg:method.icon);},
                itemCount: 2,shrinkWrap: true,separatorBuilder: (context,index)=>Gap(10.h),
              ),
              Gap(10.h),
              Row(
                children: [
                  Checkbox(
                    activeColor: AppColors.primaryColor,
                      value: checked, onChanged: (value){
                    checked=!checked;
                    setState(() {
                  
                    });
                  
                  }),
                  Expanded(child: CustomText(text: 'Save card details for future payments', textStyle:textStyle.semiBold13))
                ],
              )
          
            ],
          ),
        ),
      ),
      bottomSheet: SafeArea(
        top: false,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              )
          ),
          child:Padding(
            padding: AppDimens.scrPadding(v: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: 'Total', textStyle: textStyle.bold19),
                    customButton(text: 'Pay Now', onTap: (){
                      Navigator.pushNamed(context, SuccessView.routeName);

                    }),
                  ],
                ),
                CustomText(text: '27\$', textStyle: textStyle.bold19),

              ],
            ),
          ),
        ),
      ),
    );
  }


}
