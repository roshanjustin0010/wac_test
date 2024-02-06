import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../homescreen/view/widgets/appText.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AppText(
          title: "Cart Screen",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
