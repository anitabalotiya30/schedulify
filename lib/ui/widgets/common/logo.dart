import 'package:flutter/material.dart';

import '../../../helper/global.dart';

class Logo extends StatelessWidget {
  final double? height;
  const Logo({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(20)),

      //
      child: Image(
        image: const AssetImage('$imagePath/logo.webp'),
        height: height ?? 100,
      ),
    );
  }
}
