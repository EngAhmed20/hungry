import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/app_text_style.dart';
import '../../../shared/custom_text.dart';

class CheckoutDetails extends StatelessWidget {
  const CheckoutDetails({super.key, required this.order, required this.taxes, required this.deliveryFees, required this.total});
  final double order;
  final double taxes;
  final double deliveryFees;
  final double total;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        checkoutTitle(title: 'Order', price: order),
        Gap(5.h),
        checkoutTitle(title: 'Taxes', price: taxes),
        Gap(5.h),
        checkoutTitle(title: 'Delivery Fees', price: deliveryFees),
        Divider(),
        Gap(10.h),
        checkoutTitle(title: 'Total', price:total,isBold: true),
        Gap(5.h),
        checkoutTitle(title: 'Estimated delivery time:',deliveryTime: '30-40',),
      ],
    );
  }
}
Row checkoutTitle({
  required String title,
  double? price,
  String?deliveryTime,
  bool isBold=false,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      CustomText(text:title, textStyle:isBold?textStyle.bold16: textStyle.regular16.copyWith(color: Color(0xff7d7d7d))),
      CustomText(text:price!=null?'$price \$':'$deliveryTime min', textStyle:isBold?textStyle.bold16: textStyle.regular16),


    ],
  );
}
