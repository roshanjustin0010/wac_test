import 'package:flutter/material.dart';
import 'package:wac_test/features/homescreen/view/widgets/appText.dart';
import 'package:wac_test/features/homescreen/view/widgets/customImage.dart';
import 'package:wac_test/features/homescreen/view/widgets/spacearoundfield.dart';

import '../../modal/productContent.dart';

class ProductCard extends StatelessWidget {
  ProductContent? productContents;
  ProductCard({super.key, required this.productContents});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(5),
      height: 250,
      width: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey, width: 3)),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImage(
              height: 100,
              image: productContents?.productImage ?? "",
              width: 200,
            ),
            SpaceAroundField(height: 2),
            Center(
              child: Container(
                height: 30,
                width: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange),
                child: Center(
                  child: AppText(
                    title: 'Sale ${productContents?.discount}',
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SpaceAroundField(height: 8),
            AppText(
              title: productContents?.productName ?? "",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            AppText(
              title: productContents?.offerPrice ?? "",
              fontSize: 13,
              fontWeight: FontWeight.w500,
            ),
          ],
        ),
      ),
    );
  }
}
