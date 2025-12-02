import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../core/constants/app_dimens.dart';
import '../widgets/order_his_item.dart';

class OrderHistoryView extends StatelessWidget {
  const OrderHistoryView({super.key});

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
        child: ListView.separated(itemBuilder: (context,index)=>OrderHistoryItem(name: 'Hamburger',
          desc: 'Veggie Burger',quantity:1,onAdd: (){},onRemove:(){},
          imageUrl: '',),
            itemCount: 5,separatorBuilder: (context,index)=>Gap(10.h)
        ),
      ),
    );

  }
}
