import 'package:flutter/cupertino.dart';
import 'package:wac_test/features/homescreen/view/widgets/productCard.dart';
import 'package:wac_test/features/homescreen/view/widgets/spacearoundfield.dart';

import '../../modal/productContent.dart';
import 'appText.dart';

class MostPopular extends StatelessWidget {
  String title;
  List<ProductContent>? productContent;
  MostPopular({super.key, required this.title, required this.productContent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                title: title,
                fontSize: 15,
              ),
              AppText(
                title: "View All",
                fontSize: 13,
              )
            ],
          ),
          SpaceAroundField(
            height: 5,
          ),
          SizedBox(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productContent!.length,
                padding: const EdgeInsets.all(5),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) =>
                    ProductCard(productContents: productContent?[index])),
          )
        ],
      ),
    );
  }
}
