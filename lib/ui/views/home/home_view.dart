import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/btn/custom_btn.dart';
import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
      appBar: AppBar(
        title: const Text('Home'),
      ),

      // body
      body: Center(
          //
          child: ViewModelBuilder<HomeViewModel>.nonReactive(
        viewModelBuilder: () => HomeViewModel(),

        //
        builder: (context, viewModel, child) => Column(
          mainAxisAlignment: MainAxisAlignment.center,

          //
          children: [
            Text(
              'Tap "My Activity" to View Your Activity',
              style: ktsTitleText,
            ),

            // for giving some space
            verticalSpaceTiny,

            //
            CustomBtn(onTap: viewModel.navigateToActivity, text: 'My Activity'),
            spacedDivider,

            //
            Text(
              'Tap to "View Schedule" to View Your Schedule',
              style: ktsTitleText,
            ),
            verticalSpaceTiny,

            CustomBtn(
                onTap: viewModel.navigateToSchedList, text: 'View Schedule'),

            //
          ],
        ),
      )),
    );
  }
}
