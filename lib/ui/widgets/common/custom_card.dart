import 'package:flutter/material.dart';
import 'package:schedulify/helper/extensions.dart';

import '../../common/ui_helpers.dart';

class CustomCard extends StatelessWidget {
  final String title, desc;
  final Color color;
  const CustomCard(
      {super.key,
      required this.title,
      required this.desc,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 0,
      margin: const EdgeInsets.only(top: 12),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16))),
      //
      child: Padding(
        padding: const EdgeInsets.all(10.0),

        //
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          //
          children: [
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            verticalSpaceSmall,

            //
            Text(
              desc,
              style: const TextStyle(color: Colors.white),
            )
          ],
        ).fadeIn,
      ),
    );
  }
}
