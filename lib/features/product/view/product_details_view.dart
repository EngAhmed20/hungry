import 'package:flutter/material.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import '../widgets/spicy_widget.dart';

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
          children: [
            SpicySlider(sliderValue: sliderValue,
            onChanged: (value){
              setState(() {
                sliderValue = value;
              });
              print(value);
            },
            ),
          ],
        ),
      ),
    );
  }
}

