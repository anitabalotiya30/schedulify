import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? bgColor;
  final double fontSize;
  final double height;
  final double width;

  const CustomBtn(
      {super.key,
      this.fontSize = 16,
      required this.onTap,
      required this.text,
      this.bgColor,
      this.height = 40,
      this.width = 140});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColor ?? kcPrimaryColor,
            minimumSize: Size(width, height)),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize,
          ),
        ));
  }
}
