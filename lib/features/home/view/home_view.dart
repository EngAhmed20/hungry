import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_dimens.dart';
import 'package:hungry/features/home/view/widgets/card_item.dart';
import 'package:hungry/features/home/view/widgets/food_category.dart';
import 'package:hungry/features/home/view/widgets/search_widget.dart';
import 'package:hungry/features/home/view/widgets/user_header.dart';
import 'package:hungry/features/product/view/product_details_view.dart';
import '../../../generated/assets.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List <String>categories = ['All', 'Combos', 'Sliders', 'Classics'];
  int selectedCatIndex = 0;

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                primary: false,
                toolbarHeight: 125.h,
                backgroundColor: Colors.white,
                pinned: true,
                elevation: 0,
                scrolledUnderElevation: 0,
                automaticallyImplyLeading: false,
                title: Column(
                  children: [
                    UserHeader(userName: 'Eslam', userImg: 'https://cdn-icons-png.flaticon.com/512/1077/1077063.png'),
                    Gap(20.h),
                    Search(),
                  ],
                ),
              ),

              SliverPadding(
                padding: AppDimens.scrPadding(v: 0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Gap(20.h),
                      FoodCategory(
                        categories: categories,
                        selectedIndex: selectedCatIndex,
                        onTap: (index) {
                          setState(() {
                            selectedCatIndex = index;
                          });
                        },
                      ),
                      Gap(10.h),
                    ],
                  ),
                ),
              ),

              SliverPadding(
                padding: AppDimens.scrPadding(),
                sliver: SliverGrid.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.w,
                    crossAxisSpacing: 10.h,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    return CardItem(
                      imagePath: Assets.imagesTest,
                      title: 'Cheeseburger Wendy\'s Burger',
                      rating: 4.9,
                      onTap: () {
                        Navigator.pushNamed(context, ProductDetailsView.routeName);
                      },
                    );
                  },
                  itemCount: 8,
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}


