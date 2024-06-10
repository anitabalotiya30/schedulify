// import 'package:schedulify/app/core/custom_base_view_model.dart';

import 'package:flutter/material.dart';
import 'package:schedulify/services/api_service.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/schedule.dart';

class ScheduleListViewModel
    extends FutureViewModel<List<Map<String, List<Schedule>>>> {
  final _apiService = locator<ApiService>();
  final pageC = PageController();

  @override
  Future<List<Map<String, List<Schedule>>>> futureToRun() =>
      _apiService.getScheduleList();
}
