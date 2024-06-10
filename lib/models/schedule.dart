import 'package:flutter/material.dart';

class Schedule {
  late String id;
  final etDate = TextEditingController();
  final etTime = TextEditingController();
  final etDrName = TextEditingController();
  final etEmailCc = TextEditingController();
  final etLocation = TextEditingController();
  final etHospital = TextEditingController();
  final etProspect = TextEditingController();
  final etCoworker = TextEditingController();
  late String onlineMeeting;

  Schedule() {
    onlineMeeting = '0';
  }

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    etDate.text = json['date'] ?? '';
    etTime.text = json['time'] ?? '';
    etDrName.text = json['doc_name'] ?? '';
    etEmailCc.text = json['email_cc'] ?? '';
    onlineMeeting = json['online_meeting'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = etDate.text;
    data['time'] = etTime.text;
    data['doc_name'] = etDrName.text;
    data['online_meeting'] = onlineMeeting;
    data['email_cc'] = etEmailCc.text;
    return data;
  }
}

// class Schedule {
//   late String id;
//   late String date;
//   late String time;
//   late String drName;
//   late String emailCc;
//   late String location;
//   late String hospital;
//   late String prospect;
//   late String coWorker;
//   late String onlineMeeting;

//   Schedule() {
//     onlineMeeting = '0';
//   }

//   Schedule.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? '';
//     date = json['date'] ?? '';
//     time = json['time'] ?? '';
//     drName = json['doc_name'] ?? '';
//     emailCc = json['email_cc'] ?? '';
//     onlineMeeting = json['online_meeting'] ?? '';
//   }

//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['date'] = date;
//     data['time'] = time;
//     data['doc_name'] = drName;
//     data['online_meeting'] = onlineMeeting;
//     data['email_cc'] = emailCc;
//     return data;
//   }
// }
