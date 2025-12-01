import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/constants/app_text_style.dart';
import 'package:hungry/shared/custom_text.dart';
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
      appBar: AppBar(),
      body:  Padding(
        padding: AppDimens.scrPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpicySlider(sliderValue: sliderValue,
            onChanged: (value){
              setState(() {
                sliderValue = value;
              });
              print(value);
            },
            ),
            Gap(20.h),
            CustomText(text: 'Toppings', textStyle: textStyle.bold18),
            Gap(10.h),
            ToppingsAndOptionsCard(),
            Gap(30.h),
            Text('Side options',style: textStyle.bold18,),
            Gap(10.h),
            ToppingsAndOptionsCard(),


          ],
        ),
      ),
    );
  }
}


