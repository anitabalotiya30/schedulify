import 'package:flutter/material.dart';

import '../ui/common/app_colors.dart';

enum Activities { mind, body, money, tribe, world }

extension MyActivity on Activities {
  String get title => switch (this) {
        Activities.mind => 'Mind',
        Activities.body => 'Body',
        Activities.money => 'Money',
        Activities.tribe => 'Tribe',
        Activities.world => 'World'
      };

  Color get color => switch (this) {
        Activities.mind => kcMindArcColor,
        Activities.body => kcBodyArcColor,
        Activities.money => kcMoneyArcColor,
        Activities.tribe => kcTribeArcColor,
        Activities.world => kcWorldArcColor,
      };
}
