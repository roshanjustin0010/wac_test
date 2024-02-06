import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wac_test/features/homescreen/modal/categories.dart';
import 'package:wac_test/features/homescreen/view/widgets/spacearoundfield.dart';

import 'appText.dart';
import 'customImage.dart';

class CategoryCard extends StatelessWidget {
  String? title;
  String? url;
  CategoryCard({super.key, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 3)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomImage(
              height: 60,
              image: url ?? "",
              width: 60,
            ),
            SpaceAroundField(height: 2),
            Center(
              child: AppText(
                title: title ?? "",
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
