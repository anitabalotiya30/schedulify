import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../helper/global.dart';
import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/custom_loading.dart';
import 'schedule_list_view_model.dart';

class ScheduleListView extends StackedView<ScheduleListViewModel> {
  const ScheduleListView({super.key});

  @override
  Widget builder(
      BuildContext context, ScheduleListViewModel viewModel, Widget? child) {
    //
    return Scaffold(

        //
        appBar: AppBar(
          title: const Text('Schedule'),

          //
          actions: [
            IconButton(
                onPressed: () {
                  //
                },
                icon: const Icon(Icons.refresh))
          ],
        ),
        //
        body: !viewModel.isBusy
            ? ListView(
                padding: EdgeInsets.only(
                    left: mq.width * .04,
                    top: mq.height * .02,
                    right: mq.width * .04),

                //
                children: [
                  //
                  SizedBox(
                    height: mq.height * .4,
                    //
                    child: PageView.builder(
                      itemCount: viewModel.data?.length,
                      physics: const BouncingScrollPhysics(),

                      //
                      itemBuilder: (ctx, i) {
                        final data = viewModel.data?[i];
                        return Column(
                          //
                          children: [
                            //
                            ...data!.entries.map(
                              (e) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                //
                                children: [
                                  Text(
                                    e.key,
                                    style: ktsTitleText,
                                  ),
                                  verticalSpaceSmall,

                                  //
                                  ...e.value.map(
                                    (v) => Padding(
                                      padding: const EdgeInsets.only(bottom: 4),

                                      //
                                      child: ListTile(
                                        tileColor: Colors.amber,
                                        leading: Text(v.time),
                                        //
                                        title: Text(v.drName),
                                        subtitle: const Text('Subtitle'),

                                        //
                                        trailing: SizedBox(
                                          width: 100,

                                          //
                                          child: Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                      Icons.edit_outlined)),
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(Icons
                                                      .delete_outline_rounded))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  )
                ],
              )
            : const CustomLoading(
                color: Colors.black,
              ));
  }

  @override
  ScheduleListViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ScheduleListViewModel();
}
