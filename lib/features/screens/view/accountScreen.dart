import 'package:flutter/material.dart';

import '../../homescreen/view/widgets/appText.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: AppText(
          title: "Account Screen",
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      )),
    );
  }
}
