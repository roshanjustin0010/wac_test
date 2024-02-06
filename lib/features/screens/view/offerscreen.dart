import 'package:flutter/material.dart';

import '../../homescreen/view/widgets/appText.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AppText(
          title: "Offer Screen",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
