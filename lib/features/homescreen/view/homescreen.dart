import 'package:flutter/material.dart';

import '../../../constants/imageConstants.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent,
        leading: Image.asset(
          ImageConstants.leadingIcon,
        ),
        title: SizedBox(
          height: 50,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
        actions: const [Icon(Icons.notifications_none)],
      ),
    );
  }
}
