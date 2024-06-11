import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:schedulify/helper/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../../../helper/global.dart';
import '../../../../models/my_activity.dart';
import '../../../common/app_strings.dart';
import '../../../common/shared_styles.dart';
import '../../../common/ui_helpers.dart';
import '../my_activity_view_model.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final dataKey = GlobalKey();
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: mq.width * .04),

          //
          child: const Text(
            dummyText,
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
                child: ViewModelBuilder<MyActivityViewModel>.nonReactive(
                  viewModelBuilder: () => MyActivityViewModel(),
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
                            // percentage indicator
                            (e) {
                              // get a random percentage
                              final randomPerc = randomNumber;

                              //
                              return GestureDetector(
                                onTap: () {
                                  Scrollable.ensureVisible(
                                      dataKey.currentContext!,
                                      curve: Curves.easeIn,
                                      duration: 600.ms,
                                      alignment: 1);
                                  viewModel.visible = true;
                                },

                                //
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
                                    padding: EdgeInsets.only(
                                        bottom: mq.height * .01),
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
                      ),

                      //
                      verticalSpaceTiny,

                      ViewModelBuilder<MyActivityViewModel>.reactive(
                        viewModelBuilder: () => viewModel,

                        //
                        builder: (context, model, child) => VisibilityDetector(
                          onVisibilityChanged: (info) {
                            model.visible =
                                info.visibleFraction != 0 ? true : false;
                            log('viewModel.visible --- ${model.visible}');
                          },
                          key: _key,
                          child: model.visible
                              ? Column(
                                  key: dataKey,

                                  //
                                  children: [
                                    ...Activities.values.map(
                                      (e) => AnimatedOpacity(
                                        duration: 600.ms,
                                        opacity: model.visible ? 1 : .3,

                                        //
                                        child: Card(
                                          color: e.color,
                                          elevation: 0,
                                          margin:
                                              const EdgeInsets.only(top: 12),
                                          shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(16))),
                                          //
                                          child: Padding(
                                            padding: const EdgeInsets.all(10.0),

                                            //
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,

                                              //
                                              children: [
                                                Text(
                                                  e.title,
                                                  style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16),
                                                ),
                                                verticalSpaceSmall,

                                                //
                                                const Text(
                                                  dummyText,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            )
                                                .animate()
                                                .fadeIn(duration: 1000.ms),
                                          ),
                                        ),
                                      ),
                                    )
                                  ].animateList,
                                )
                              : const SizedBox(),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ],
    );
  }
}
