import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_test/features/homescreen/controller/provider/navigationBarProvider.dart';
import 'package:wac_test/features/homescreen/view/homescreen.dart';
import 'package:wac_test/features/homescreen/view/widgets/bottomNavigationBar.dart';
import 'package:wac_test/features/screens/view/accountScreen.dart';
import 'package:wac_test/features/screens/view/cartscreen.dart';
import 'package:wac_test/features/screens/view/categoryScreen.dart';
import 'package:wac_test/features/screens/view/offerscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var screens = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    OfferScreen(),
    AccountScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationBarProvider>(
        builder: (context, navProvider, child) {
      return Scaffold(
        body: SafeArea(child: screens[navProvider.currentIndex]),
        bottomNavigationBar: const BottomNavigation(),
      );
    });
  }
}
