import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String title;
  Color? textColor;
  double? fontSize;
  FontWeight? fontWeight;
  TextOverflow? textOverFlow;
  TextDecoration? textDecoration;

  AppText(
      {super.key,
      required this.title,
      this.fontWeight,
      this.fontSize,
      this.textOverFlow,
      this.textColor,
      this.textDecoration});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        decoration: textDecoration ?? TextDecoration.none,
        color: textColor ?? Colors.black,
        fontSize: fontSize ?? 15,
        fontWeight: fontWeight ?? FontWeight.w400,
        overflow: textOverFlow ?? TextOverflow.ellipsis,
      ),
    );
  }
}
