class Schedule {
  late String id;
  late String date;
  late String time;
  late String drName;
  late String onlineMeeting;
  late String emailCc;

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    date = json['date'] ?? '';
    time = json['time'] ?? '';
    drName = json['doc_name'] ?? '';
    onlineMeeting = json['online_meeting'] ?? '';
    emailCc = json['email_cc'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['time'] = time;
    data['doc_name'] = drName;
    data['online_meeting'] = onlineMeeting;
    data['email_cc'] = emailCc;
    return data;
  }
}
