import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:stacked/stacked.dart';

import '../../../helper/global.dart';
import '../../../models/my_activity.dart';
import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import './my_activity_view_model.dart';

class MyActivityView extends StackedView<MyActivityViewModel> {
  const MyActivityView({super.key});

  @override
  Widget builder(
      BuildContext context, MyActivityViewModel viewModel, Widget? child) {
    return Scaffold(
        backgroundColor: const Color(0XFF9381ff),

        //
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0XFF9381ff),
          iconTheme: const IconThemeData(color: Colors.white),
          title:
              const Text('My Activity', style: TextStyle(color: Colors.white)),

          //
          actions: [
            IconButton(onPressed: viewModel.back, icon: const Icon(Icons.home))
          ],
        ),

        //
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: mq.width * .04),

              //
              child: const Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s '
                'standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make '
                'a type specimen book.',
              ),
            ),

            //
            Expanded(
              child: Container(
                width: mq.width,
                margin: EdgeInsets.only(top: mq.height * .04),

                //
                padding: EdgeInsets.only(
                    top: mq.height * .02,
                    left: mq.width * .04,
                    right: mq.width * .04),

                //
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(50))),

                //
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),

                  //
                  child: Column(
                    //
                    children: [
                      //
                      Wrap(
                        spacing: mq.width * .12,
                        runSpacing: mq.height * .04,
                        alignment: WrapAlignment.center,
                        children: [
                          // list of activity
                          ...Activities.values.map(
                            // percentage indicator
                            (e) {
                              // get a random percentage
                              final randomPerc = randomNumber;

                              //
                              return CircularPercentIndicator(
                                radius: 60,
                                animation: true,
                                animateFromLastPercent: true,
                                circularStrokeCap: CircularStrokeCap.round,
                                animationDuration: 1200,
                                lineWidth: 16,
                                startAngle: 0.0,
                                percent: (randomPerc / 100),
                                progressColor: e.color,
                                center:
                                    Text('$randomPerc%', style: ktsTitleText),

                                //
                                header: Padding(
                                  padding:
                                      EdgeInsets.only(bottom: mq.height * .01),
                                  child: Text(e.title, style: ktsTitleText),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      verticalSpaceMedium,

                      //

                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'YOUR NUMBERS LOOK GRATE',
                          style: ktsTitleText,
                        ),
                      ),

                      // for giving some space
                      verticalSpaceTiny,

                      //
                      const Text(
                        'Your numbers look great in all key areas—Mind, Money, Body, Tribe, and World. '
                        'Keep up the excellent work! Your dedication to mental well-being, financial growth, '
                        'physical health, strong relationships, and positive societal impact is clearly paying off. '
                        'Maintain this balanced approach to life; it\'s truly impressive!',
                      ),

                      //
                      verticalSpaceMedium
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  @override
  MyActivityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MyActivityViewModel();
}
