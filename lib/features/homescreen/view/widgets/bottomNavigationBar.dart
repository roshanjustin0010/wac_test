import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_tab_bar/MotionTabBar.dart';
import 'package:motion_tab_bar/MotionTabBarController.dart';
import 'package:provider/provider.dart';
import 'package:wac_test/features/homescreen/controller/provider/navigationBarProvider.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with TickerProviderStateMixin {
  MotionTabBarController? _motionTabBarController;

  @override
  void initState() {
    super.initState();
    _motionTabBarController = MotionTabBarController(
      initialIndex: 1,
      length: 5,
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _motionTabBarController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MotionTabBar(
      controller:
          _motionTabBarController, // Add this controller if you need to change your tab programmatically
      initialSelectedTab: "Home",
      useSafeArea: true, // default: true, apply safe area wrapper
      labels: const ["Home", "Category", "Cart", "Offers", "Account"],
      icons: const [
        Icons.home,
        Icons.category_outlined,
        Icons.shopping_cart_rounded,
        Icons.percent,
        Icons.person
      ],

      // optional badges, length must be same with labels

      tabSize: 50,
      tabBarHeight: 55,
      textStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      tabIconColor: Colors.black,
      tabIconSize: 28.0,
      tabIconSelectedSize: 26.0,
      tabSelectedColor: Colors.green[400],
      tabIconSelectedColor: Colors.white,
      tabBarColor: Colors.white,
      onTabItemSelected: (int value) {
        context.read<NavigationBarProvider>().changeCurrentIndex(value);
        setState(() {
          _motionTabBarController!.index = value;
        });
      },
    );
  }
}
