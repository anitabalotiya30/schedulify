import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:schedulify/helper/extensions.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../helper/endpoints.dart';
import '../helper/global.dart';
import '../models/schedule.dart';
import '../ui/dialogs/my_dialogs/my_dialogs.dart';

class ApiService {
  static final _navService = locator<NavigationService>();

  Future<List<Map<String, List<Schedule>>>> getScheduleList() async {
    var schedule = <Map<String, List<Schedule>>>[];
    try {
      final response = await http.get(Uri.parse(schedListUrl));

      //
      if (response.statusCode == 200) {
        final Iterable data = jsonDecode(response.body);
        final mainList = data.map((e) => Schedule.fromJson(e)).toList();

        final list =
            mainList.where((e) => e.etDate.text.dateTime != null).toList();
        final others =
            mainList.where((e) => e.etDate.text.dateTime == null).toList();

        // sort the list by date
        list.sort((a, b) =>
            a.etDate.text.dateTime!.compareTo(b.etDate.text.dateTime!));

        // Group schedules by month using a map
        final scheduleMap = <String, List<Schedule>>{};

        for (var e in list) {
          final month = dateFormatter(date: e.etDate.text, format: 'MMM yyyy')!;
          if (scheduleMap.containsKey(month)) {
            scheduleMap[month]!.add(e);
          } else {
            scheduleMap[month] = [e];
          }
        }

        // Add unsorted items to the scheduleMap
        for (var e in others) {
          if (scheduleMap.containsKey(e.etDate.text)) {
            scheduleMap[e.etDate.text]?.add(e);
          } else {
            scheduleMap[e.etDate.text] = [e];
          }
        }

        // Convert map to desired format
        schedule.addAll(scheduleMap.entries
            .map((entry) => {entry.key: entry.value})
            .toList());
        log('schedule --- ${schedule.length}');
        return schedule;
      }
      return schedule;
    } catch (e) {
      log('err --- ${e.toString()}');
      return schedule;
    }
  }

  static Future<void> createSchedule(Map<String, dynamic> jsonBody) async {
    try {
      MyDialogs.showProgressBar();
      final response = await http.post(
        Uri.parse(createSchedUrl),
        body: jsonEncode(jsonBody),
      );
      _navService.back();

      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        MyDialogs.success(msg: message);
      }
    } catch (e) {
      log(e.toString());
      MyDialogs.error(msg: 'Something went wrong.');
    }
  }

  static Future<void> updateSchedule(Map<String, dynamic> jsonBody) async {
    try {
      MyDialogs.showProgressBar();
      final response = await http.put(
        Uri.parse(updateSchedUrl),
        body: jsonEncode(jsonBody),
      );
      _navService.back();

      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        MyDialogs.success(msg: message);
      }
    } catch (e) {
      log(e.toString());
      MyDialogs.error(msg: 'Something went wrong.');
    }
  }

  static Future<void> deleteSchedule(String id) async {
    try {
      MyDialogs.showProgressBar();
      final response = await http.delete(Uri.parse('$deleteSchedUrl?id=$id'));
      _navService.back();

      if (response.statusCode == 200) {
        final message = jsonDecode(response.body)['message'];
        MyDialogs.success(msg: message);
      }
    } catch (e) {
      log(e.toString());
      MyDialogs.error(msg: 'Something went wrong.');
    }
  }
}
