import 'package:flutter/material.dart';
import 'package:schedulify/helper/extensions.dart';
import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../models/schedule.dart';
import '../../../services/api_service.dart';
import '../../dialogs/my_dialogs/my_dialogs.dart';

class ScheduleListViewModel
    extends FutureViewModel<List<Map<String, List<Schedule>>>> {
  final _apiService = locator<ApiService>();

  final schedule = Schedule();
  final pageC = PageController();
  final scrollC = ScrollController();
  bool switchValue = false;
  bool clickEdit = false;

  @override
  Future<List<Map<String, List<Schedule>>>> futureToRun() =>
      _apiService.getScheduleList();

  void onClickAddSched() async {
    if (validate()) {
      await ApiService.createSchedule(schedule.toJson());
      final getData = await futureToRun();
      data = List.from(getData);
      reset();
    } else {
      MyDialogs.error(msg: 'Fields marked with an asterisk (*) are required.');
    }
  }

  Future<void> onUpdate() async {
    if (validate()) {
      final updateJson = schedule.toJson();
      updateJson['id'] = schedule.id;
      await ApiService.updateSchedule(updateJson);
      final getData = await futureToRun();
      data = List.from(getData);
      reset();
    } else {
      MyDialogs.error(msg: 'Fields marked with an asterisk (*) are required.');
    }
  }

  void onToggleSwitch(bool v) {
    switchValue = v;
    schedule.onlineMeeting = v ? '1' : '0';
    notifyListeners();
  }

  void onClickEdit(Schedule sched) {
    schedule.id = sched.id;
    schedule.etDate.text = sched.etDate.text;
    schedule.etTime.text = sched.etTime.text;
    schedule.etEmailCc.text = sched.etEmailCc.text;
    schedule.etDrName.text = sched.etDrName.text;
    schedule.onlineMeeting = sched.onlineMeeting;
    switchValue = sched.onlineMeeting != '0' ? true : false;
    scrollC.animateTo(0,
        duration: const Duration(milliseconds: 600), curve: Curves.ease);
    clickEdit = true;
    notifyListeners();
  }

  void upcomingSched({bool nextPage = true}) {
    final currentPage = pageC.page!.ceil();
    final viewPage = nextPage
        ? (currentPage < data!.length ? currentPage + 1 : currentPage)
        : (currentPage > 0 ? currentPage - 1 : currentPage);
    pageC.animateToPage(viewPage,
        duration: const Duration(milliseconds: 600), curve: Curves.easeIn);
  }

  void reset() {
    schedule.etDate.text = '';
    schedule.etTime.text = '';
    schedule.etLocation.text = '';
    schedule.etHospital.text = '';
    schedule.etProspect.text = '';
    schedule.etCoworker.text = '';
    schedule.etEmailCc.text = '';
    schedule.onlineMeeting = '0';
    switchValue = false;
    clickEdit = false;
    notifyListeners();
  }

  // void reset() {
  // }

  bool validate() {
    final date = schedule.etDate.text;
    final time = schedule.etTime.text;
    final prospect = schedule.etProspect.text;

    if (date.isValid && time.isValid && prospect.isValid) {
      return true;
    }
    return false;
  }
}
