import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingStar extends StatelessWidget {
  int? count;
  RatingStar({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        if (index < count!) {
          return const Icon(
            Icons.star,
            color: Colors.orange,
            size: 20,
          );
        } else {
          return const Icon(
            Icons.star,
            color: Colors.grey,
            size: 20,
          );
        }
      },
      itemCount: 5,
    );
  }
}
