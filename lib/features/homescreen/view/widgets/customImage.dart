import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  double height;
  double width;
  BoxFit? boxFit;
  String image;
  CustomImage(
      {super.key,
      required this.width,
      required this.height,
      required this.image,
      this.boxFit});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      height: height,
      width: width,
      fit: boxFit ?? BoxFit.contain,
    );
  }
}
