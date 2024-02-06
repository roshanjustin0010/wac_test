import 'package:flutter/material.dart';
import 'package:wac_test/features/homescreen/view/widgets/appText.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AppText(
          title: "Category Screen",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
