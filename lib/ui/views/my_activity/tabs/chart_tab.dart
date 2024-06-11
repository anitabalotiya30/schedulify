import 'package:flutter/material.dart';

import '../../../common/shared_styles.dart';

class ChartTab extends StatelessWidget {
  const ChartTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Chart Screen',
        style: ktsHeadingText,
      ),
    );
  }
}
