import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../views/schedule_list/schedule_list_view_model.dart';

class CustomSwitch extends StatelessWidget {
  final ScheduleListViewModel viewModel;
  const CustomSwitch({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      value: viewModel.switchValue,
      onChanged: (v) => viewModel.onToggleSwitch(v),
      activeColor: Colors.blue,
    );
  }
}
