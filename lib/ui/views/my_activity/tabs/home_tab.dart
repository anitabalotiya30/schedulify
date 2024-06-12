import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:schedulify/helper/extensions.dart';
import 'package:stacked/stacked.dart';

import '../../../../helper/global.dart';
import '../../../../models/my_activity.dart';
import '../../../common/app_strings.dart';
import '../../../common/shared_styles.dart';
import '../../../common/ui_helpers.dart';
import '../../../widgets/common/custom_card.dart';
import '../my_activity_view_model.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      //
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .04),

          //
          child: const Text(
            dummyText,
          ).fadeIn,
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
              child: ViewModelBuilder<MyActivityViewModel>.nonReactive(
                viewModelBuilder: () => MyActivityViewModel(),

                //
                builder: (context, viewModel, child) => Column(
                  //
                  children: [
                    //
                    Wrap(
                      spacing: mq.width * .11,
                      runSpacing: mq.height * .04,
                      alignment: WrapAlignment.center,
                      children: [
                        // list of activity
                        ...Activities.values.map(
                          (e) {
                            // get a random percentage
                            final randomPerc = randomNumber;

                            //
                            return GestureDetector(
                              onTap: () => Scrollable.ensureVisible(
                                  viewModel.dataKey.currentContext!,
                                  curve: Curves.easeIn,
                                  duration: 600.ms,
                                  alignment: 1),

                              // percentage indicator
                              child: CircularPercentIndicator(
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
                    ).fadeIn,

                    //
                    verticalSpaceTiny,

                    Column(
                      key: viewModel.dataKey,

                      //
                      children: [
                        ...Activities.values.map(
                          (e) => CustomCard(
                              title: e.title, desc: dummyText, color: e.color),
                        )
                      ].animateList,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
