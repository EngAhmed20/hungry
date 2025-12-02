import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/core/constants/app_text_style.dart';
import 'package:hungry/shared/custom_button.dart';
import 'package:hungry/shared/custom_text.dart';

import '../widgets/cart_item.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late List <int>quantities;
  int itemCount=20;
  @override
  void initState() {
    quantities=List.generate(itemCount, (_)=>1);
    super.initState();
  }
  onAdd(index){
    setState(() {
      quantities[index]++;
    });
  }
  onRemove(index){
    setState(() {
      if(quantities[index]>1){
        quantities[index]--;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        toolbarHeight: 20.h,

      ),
      body: Padding(
        padding: AppDimens.scrPadding(),
        child: ListView.separated(itemBuilder: (context,index)=>CartItem(name: 'Hamburger',
          desc: 'Veggie Burger',quantity: quantities[index],onAdd: ()=>onAdd(index),onRemove:()=>onRemove(index),
          imageUrl: '',),
          itemCount: 5,separatorBuilder: (context,index)=>Gap(10.h)
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
                    customButton(text: 'Add to Cart', onTap: (){}),
                  ],
                ),
                CustomText(text: '\$99.5', textStyle: textStyle.bold19),

              ],
            ),
          ),
        ),
      ),
    );

  }
}

