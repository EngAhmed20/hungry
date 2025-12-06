import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/constants/app_text_style.dart';
import 'package:hungry/shared/custom_text.dart';
import '../../../shared/custom_button.dart';
import '../widgets/spicy_widget.dart';
import '../widgets/toppings_options_card.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});
  static const String routeName = '/productDetails';

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  double sliderValue =0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      body:  Padding(
        padding: AppDimens.scrPadding(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SpicySlider(sliderValue: sliderValue,
              onChanged: (value){
                setState(() {
                  sliderValue = value;
                });
              },
              ),
              Gap(20.h),
              CustomText(text: 'Toppings', textStyle: textStyle.bold19),
              Gap(10.h),
              ToppingsAndOptionsCard(),
              Gap(30.h),
              Text('Side options',style: textStyle.bold19,),
              Gap(10.h),
              ToppingsAndOptionsCard(),
              Gap(20.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomText(text: 'Total', textStyle: textStyle.bold19),
                      customButton(text: 'Add to Cart', onTap: (){}),
                    ],
                  ),
                  CustomText(text: '99.5\$', textStyle: textStyle.bold19),

                ],
              ),
              Gap(20.h),

            ],
          ),
        ),
      ),
    );
  }

}


