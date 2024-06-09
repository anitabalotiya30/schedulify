import 'package:flutter/material.dart';

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
        Activities.mind => const Color(0XFFb5179e),
        Activities.body => const Color(0XFFffbe0b),
        Activities.money => const Color(0XFFc9ada7),
        Activities.tribe => const Color(0XFF5fc1b2),
        Activities.world => const Color(0XFFf72585),
      };
}
