import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:schedulify/helper/extensions.dart';

import '../helper/endpoints.dart';
import '../helper/global.dart';
import '../models/schedule.dart';

class ApiService {
  Future<List<Map<String, List<Schedule>>>> getScheduleList() async {
    var schedule = <Map<String, List<Schedule>>>[];
    try {
      final response = await http.get(Uri.parse(schedListUrl));

      //
      if (response.statusCode == 200) {
        final Iterable data = jsonDecode(response.body);
        final mainList = data.map((e) => Schedule.fromJson(e)).toList();

        // Filter and sort the list in one step
        final list = mainList.where((e) => e.date.dateTime != null).toList()
          ..sort((a, b) => a.date.dateTime!.compareTo(b.date.dateTime!));

        // Group schedules by month using a map
        final scheduleMap = <String, List<Schedule>>{};

        for (var e in list) {
          final month = dateFormatter(date: e.date, format: 'MMM yyyy')!;
          if (scheduleMap.containsKey(month)) {
            scheduleMap[month]!.add(e);
          } else {
            scheduleMap[month] = [e];
          }
        }

        // Convert map to desired format
        schedule.addAll(scheduleMap.entries
            .map((entry) => {entry.key: entry.value})
            .toList());

        return schedule;
      }
      return schedule;
    } catch (e) {
      log('err --- ${e.toString()}');
      return schedule;
    }
  }
}
