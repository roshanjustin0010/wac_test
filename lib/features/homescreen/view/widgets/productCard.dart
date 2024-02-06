import 'package:flutter/material.dart';
import 'package:wac_test/features/homescreen/view/widgets/appText.dart';
import 'package:wac_test/features/homescreen/view/widgets/customImage.dart';
import 'package:wac_test/features/homescreen/view/widgets/ratingstar.dart';
import 'package:wac_test/features/homescreen/view/widgets/spacearoundfield.dart';

import '../../modal/productContent.dart';

class ProductCard extends StatelessWidget {
  ProductContent? productContents;
  ProductCard({super.key, required this.productContents});

  @override
  Widget build(BuildContext context) {
    print(productContents?.discount?.split("%").first);
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
            if (int.parse(productContents?.discount!.split('%').first ?? '0') >
                0)
              Container(
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
            SpaceAroundField(height: 8),
            AppText(
              title: productContents?.productName ?? "",
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 20,
              child: RatingStar(count: productContents?.productRating),
            ),
            Row(
              children: [
                AppText(
                  title: "₹ ${productContents?.offerPrice!.split('â¹').last}",
                  //text splitted by error text , then take last value
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
                SpaceAroundField(
                  width: 10,
                ),
                if (productContents?.offerPrice != productContents?.actualPrice)
                  AppText(
                    title:
                        "₹ ${productContents?.actualPrice!.split('â¹').last}",
                    //text splitted by error text , then take last value
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    textDecoration: TextDecoration.lineThrough,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
