import 'package:flutter/cupertino.dart';
import 'package:wac_test/features/homescreen/modal/categories.dart';
import 'package:wac_test/features/homescreen/view/widgets/categoryCard.dart';
import 'package:wac_test/features/homescreen/view/widgets/productCard.dart';
import 'package:wac_test/features/homescreen/view/widgets/spacearoundfield.dart';

import 'appText.dart';

class CategorySection extends StatelessWidget {
  String? title;
  Categories? categories;
  CategorySection({super.key, required this.categories, required this.title});

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
                title: title ?? "",
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
            height: 125,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories!.contents!.length,
                padding: const EdgeInsets.all(5),
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => CategoryCard(
                      title: categories!.contents?[index].title,
                      url: categories!.contents?[index].imageUrl,
                    )),
          )
        ],
      ),
    );
    ;
  }
}
