import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      // onModelReady: (SplashViewModel model) async {
      //   await model.init();
      // },
      builder: (
        BuildContext context,
        SplashViewModel model,
        Widget? child,
      ) {
        return const Scaffold(
          body: Center(
            child: Text(
              'SplashView',
            ),
          ),
        );
      },
    );
  }
}
