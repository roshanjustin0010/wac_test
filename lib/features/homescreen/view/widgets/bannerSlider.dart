import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wac_test/features/homescreen/modal/bannerSlider.dart';

class BannerCarouselSlider extends StatelessWidget {
  BannerSlider? bannerSlider;
  BannerCarouselSlider({super.key, required this.bannerSlider});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150,
        enlargeCenterPage: true,
        autoPlay: true,
        // aspectRatio: 16 / 9,
        autoPlayCurve: Curves.fastOutSlowIn,
        enableInfiniteScroll: true,
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        viewportFraction: 0.8,
      ),
      items: bannerSlider?.contents?.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: NetworkImage(url.imageUrl ?? ""),
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
    ;
  }
}
