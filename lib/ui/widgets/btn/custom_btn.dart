import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class CustomBtn extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double fontSize;
  final bool whiteBtn;

  const CustomBtn(
      {super.key,
      this.fontSize = 17,
      required this.onTap,
      required this.text,
      this.whiteBtn = false});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: kcPrimaryColor,
      elevation: .2,

      //
      onPressed: onTap,

      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
