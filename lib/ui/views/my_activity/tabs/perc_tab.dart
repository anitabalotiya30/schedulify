import 'package:flutter/material.dart';
import 'package:schedulify/helper/extensions.dart';

import '../../../../helper/global.dart';
import '../../../../models/my_activity.dart';
import '../../../common/app_strings.dart';
import '../../../widgets/common/custom_card.dart';

class PercentageTab extends StatelessWidget {
  const PercentageTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.only(
          left: mq.width * .04, right: mq.width * .04, bottom: mq.height * .04),

      //
      children: [
        ...Activities.values.map(
            (e) => CustomCard(title: e.title, desc: dummyText, color: e.color))
      ].animateList,
    );
  }
}
