import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../helper/global.dart';
import '../../common/shared_styles.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/common/custom_loading.dart';
import 'schedule_list_laptop_view.dart';
import 'schedule_list_mobile_view.dart';
import 'schedule_list_view_model.dart';

class ScheduleListView extends StatelessWidget {
  const ScheduleListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Schedule'),
      ),
      //
      body: ViewModelBuilder<ScheduleListViewModel>.reactive(
        viewModelBuilder: () => ScheduleListViewModel(),

        //
        builder: (context, viewModel, child) => ListView(
          controller: viewModel.scrollC,

          //
          padding: EdgeInsets.only(left: mq.width * .04, right: mq.width * .04),

          //
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                  onPressed: viewModel.reset, child: const Text('All Clear')),
            ),
            //
            LayoutBuilder(
                builder: (context, constraints) => constraints.maxWidth < 500
                    ? ScheduleListMobileView(viewModel: viewModel)
                    : ScheduleListLaptopView(viewModel: viewModel)),

            //
            spacedDivider,

            //
            Text('Upcoming Schedule', style: ktsHeadingText),

            // for giving some space vertically
            verticalSpaceSmall,

            SizedBox(
                height: mq.height * .26,

                //
                child: _ViewUpcomingSchedule(viewModel: viewModel)),

            // for giving some space
            verticalSpaceSmall,
            const Divider(),

            // to view upcoming schedule
            Row(
              children: [
                // next
                IconButton(
                    onPressed: () => viewModel.upcomingSched(nextPage: false),
                    icon: const Icon(Icons.arrow_back)),

                // back
                IconButton(
                    onPressed: viewModel.upcomingSched,
                    icon: const Icon(Icons.arrow_forward)),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _ViewUpcomingSchedule extends StatelessWidget {
  final ScheduleListViewModel viewModel;

  const _ViewUpcomingSchedule({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return !viewModel.isBusy
        ? PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: viewModel.pageC,
            itemCount: viewModel.data?.length,

            //
            itemBuilder: (ctx, i) {
              final data = viewModel.data?[i];
              return ListView(
                //
                children: [
                  ...data!.entries.map(
                    (e) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      //
                      children: [
                        //
                        Text(
                          e.key,
                          style: ktsTitleText,
                        ),
                        const Divider(),

                        ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          //
                          children: [
                            ...e.value.map(
                              (v) => ListTile(
                                dense: true,
                                leading: Text(v.etTime.text),
                                title: Text(v.etDrName.text),
                                subtitle: Text(v.etProspect.text),
                                trailing: SizedBox(
                                  width: 100,

                                  //
                                  child: Row(
                                    children: [
                                      // edit record
                                      IconButton(
                                          onPressed: () =>
                                              viewModel.onClickEdit(v),
                                          icon:
                                              const Icon(Icons.edit_outlined)),

                                      //  delete record
                                      IconButton(
                                          onPressed: () =>
                                              viewModel.deleteRecord(v.id),
                                          icon: const Icon(
                                              Icons.delete_outline_rounded)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        : const CustomLoading(
            color: Colors.black,
          );
  }
}
