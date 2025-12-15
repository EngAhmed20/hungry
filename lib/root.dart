import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hungry/core/utils/pref_helper.dart';
import 'package:hungry/features/auth/view/profile_view.dart';
import 'package:hungry/features/cart/view/cart_view.dart';
import 'package:hungry/features/home/view/home_view.dart';
import 'package:hungry/features/orderHistrory/view/order_history_view.dart';
import 'package:hungry/shared/bottom_nav_bar.dart';

class Root extends StatefulWidget {
  const Root({super.key});
  static const String routeName = '/root';

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  late List<Widget> Screens;
  int currentIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    Screens=[
      HomeView(),
      CartView(),
      OrderHistoryView(),
      ProfileView(),
    ];
    pageController=PageController(initialPage: currentIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        children: Screens,
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (index){
          setState(() {
            currentIndex=index;
          });
        },


      ),
      bottomNavigationBar: bottomNavBar(index: currentIndex,onTap: (index){
        setState(() {
          currentIndex=index;
          pageController.jumpToPage(index);
        });
      }),
    );
  }

}
