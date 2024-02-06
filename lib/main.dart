import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wac_test/features/homescreen/controller/provider/homeScreenProvider.dart';
import 'package:wac_test/features/homescreen/controller/provider/navigationBarProvider.dart';
import 'package:wac_test/features/homescreen/view/homepage.dart';
import 'package:wac_test/features/homescreen/view/homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WAC Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider<HomeScreenProvider>(
            create: (context) => HomeScreenProvider()),
        ChangeNotifierProvider<NavigationBarProvider>(
            create: (context) => NavigationBarProvider())
      ], child: HomePage()),
    );
  }
}
