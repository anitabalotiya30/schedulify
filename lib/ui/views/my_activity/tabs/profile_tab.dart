import 'package:flutter/material.dart';

import '../../../common/shared_styles.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Profile Screen',
        style: ktsHeadingText,
      ),
    );
  }
}
