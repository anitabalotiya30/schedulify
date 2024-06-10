import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../helper/global.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/btn/custom_btn.dart';
import '../../widgets/schedule/custom_dropdown.dart';
import '../../widgets/schedule/custom_switch.dart';
import '../../widgets/schedule/custom_text_field.dart';
import '../../widgets/schedule/date_time_picker.dart';
import 'schedule_list_view_model.dart';

class ScheduleListMobileView extends StatelessWidget {
  final ScheduleListViewModel viewModel;
  const ScheduleListMobileView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        //
        children: [
          // select date
          CustomTextField(
            label: 'Date*',
            readOnly: true,
            c: viewModel.schedule.etDate,
            onTap: () async {
              final selectedData = await DateTimePickerDialog().datePicker();

              if (selectedData != null) {
                viewModel.schedule.etDate.text = selectedData;
              }
            },
          ),
          verticalSpaceMedium,

          //
          CustomDropDown(
              c: viewModel.schedule.etLocation,
              list: List.generate(5, (i) => 'Location ${i + 1}'),
              label: 'Location/State',
              onSelect: (v) => viewModel.schedule.etLocation.text = v!),
          verticalSpaceMedium,

          //
          CustomDropDown(
              c: viewModel.schedule.etHospital,
              list: List.generate(5, (i) => 'Hospital ${i + 1}'),
              label: 'Hospital/Site Name',
              onSelect: (v) => viewModel.schedule.etHospital.text = v!),
          verticalSpaceMedium,

          //
          CustomTextField(
            label: 'Time*',
            c: viewModel.schedule.etTime,
            readOnly: true,
            onTap: () async {
              final selectedTime = await DateTimePickerDialog().timePicker();

              if (selectedTime != null) {
                viewModel.schedule.etTime.text = selectedTime;
              }
            },
          ),
          verticalSpaceMedium,
          //
          CustomDropDown(
              c: viewModel.schedule.etProspect,
              list: List.generate(5, (i) => 'Prospects ${i + 1}'),
              label: 'Prospects*',
              onSelect: (v) => viewModel.schedule.etProspect.text = v!),
          verticalSpaceMedium,

          //
          CustomDropDown(
              c: viewModel.schedule.etCoworker,
              list: List.generate(5, (i) => 'Co Worker ${i + 1}'),
              label: 'Co Worker',
              onSelect: (v) => viewModel.schedule.etCoworker.text = v!),
          verticalSpaceMedium,

          //
          Row(
            children: [
              CustomSwitch(
                viewModel: viewModel,
              ),
              horizontalSpaceSmall,
              const Text('Schedule Online Meeting')
            ],
          ),
          verticalSpaceMedium,

          //
          CustomTextField(
            label: 'CC Email ID',
            c: viewModel.schedule.etEmailCc,
          ),
          verticalSpaceMedium,

          //

          CustomBtn(
              width: mq.width * .5,
              height: mq.height * .06,
              bgColor: Colors.blue,
              onTap: !viewModel.clickEdit
                  ? viewModel.onClickAddSched
                  : viewModel.onUpdate,
              text: '${viewModel.clickEdit ? 'Edit' : 'Add'}  Schedule')
        ]);
  }
}
