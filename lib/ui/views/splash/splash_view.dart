import 'package:flutter/material.dart';
import 'package:schedulify/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../widgets/common/custom_loading.dart';
import '../../widgets/common/logo.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),

      // This is where you can make decisions on where your app should navigate when
      // you have custom startup logic
      () => locator<NavigationService>().replaceWithHomeView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //
      body: SizedBox(
        width: double.maxFinite,

        //
        child: Column(
          children: [
            Spacer(flex: 2),

            // logo
            Logo(height: 150),

            Spacer(),

            // loading
            CustomLoading(
              color: Colors.black,
            ),

            Spacer(),
          ],
        ),
      ),
    );
  }
}
