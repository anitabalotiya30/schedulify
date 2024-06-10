import 'package:flutter/material.dart';

import '../../../helper/global.dart';
import '../../common/ui_helpers.dart';
import '../../widgets/btn/custom_btn.dart';
import '../../widgets/schedule/custom_dropdown.dart';
import '../../widgets/schedule/custom_switch.dart';
import '../../widgets/schedule/custom_text_field.dart';
import '../../widgets/schedule/date_time_picker.dart';
import 'schedule_list_view_model.dart';

class ScheduleListLaptopView extends StatelessWidget {
  final ScheduleListViewModel viewModel;
  const ScheduleListLaptopView({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //
      children: [
        Row(
          //
          children: [
            Expanded(
                child: CustomTextField(
              label: 'Date*',
              c: viewModel.schedule.etDate,
              readOnly: true,
              onTap: () async {
                final selectedDate = await DateTimePickerDialog().datePicker();

                if (selectedDate != null) {
                  viewModel.schedule.etDate.text = selectedDate;
                }
              },
            )),
            horizontalSpaceSmall,

            //

            Expanded(
              child: CustomDropDown(
                  c: viewModel.schedule.etLocation,
                  list: List.generate(5, (i) => 'Location ${i + 1}'),
                  label: 'Location/State',
                  onSelect: (v) => viewModel.schedule.etLocation.text = v!),
            ),
            horizontalSpaceSmall,

            Expanded(
              child: CustomDropDown(
                  c: viewModel.schedule.etHospital,
                  list: List.generate(5, (i) => 'Hospital ${i + 1}'),
                  label: 'Hospital/Site Name',
                  onSelect: (v) => viewModel.schedule.etHospital.text = v!),
            ),

            //
          ],
        ),

        //
        verticalSpaceMedium,
        Row(
          //
          children: [
            Expanded(
                child: CustomTextField(
              label: 'Time*',
              c: viewModel.schedule.etTime,
              readOnly: true,
              onTap: () async {
                final selectedTime = await DateTimePickerDialog().timePicker();

                if (selectedTime != null) {
                  viewModel.schedule.etTime.text = selectedTime;
                }
              },
            )),
            horizontalSpaceSmall,

            //
            Expanded(
                child: CustomDropDown(
                    c: viewModel.schedule.etProspect,
                    list: List.generate(5, (i) => 'Prospects ${i + 1}'),
                    label: 'Prospects*',
                    onSelect: (v) => viewModel.schedule.etProspect.text = v!)),
            horizontalSpaceSmall,

            //
            Expanded(
              child: CustomDropDown(
                  c: viewModel.schedule.etCoworker,
                  list: List.generate(5, (i) => 'Co Worker ${i + 1}'),
                  label: 'Co Worker',
                  onSelect: (v) => viewModel.schedule.etCoworker.text = v!),
            ),
          ],
        ),

        //
        //
        verticalSpaceMedium,
        Row(
          //
          children: [
            Expanded(
              child: Row(
                children: [
                  CustomSwitch(viewModel: viewModel),
                  horizontalSpaceSmall,
                  const Expanded(child: Text('Schedule Online Meeting'))
                ],
              ),
            ),
            horizontalSpaceSmall,

            //
            Expanded(
                child: CustomTextField(
              label: 'CC Email ID',
              c: viewModel.schedule.etEmailCc,
            )),
            horizontalSpaceSmall,

            //
            Expanded(
                child: CustomBtn(
                    width: mq.width * .5,
                    height: mq.height * .06,
                    bgColor: Colors.blue,
                    onTap: !viewModel.clickEdit
                        ? viewModel.onClickAddSched
                        : viewModel.onUpdate,
                    text: '${viewModel.clickEdit ? 'Edit' : 'Add'}  Schedule')),
          ],
        ),
      ],
    );
  }
}
