import 'dart:math';
import 'dart:developer' as dev;
import 'dart:ui';

import 'package:intl/intl.dart';
import 'package:schedulify/helper/extensions.dart';

late Size mq;

const appName = 'Schedulify';
const packageName = 'com.timekeeper.schedulify';
// const appVersion = 'v1.0.1';

const imagePath = 'assets/images';

int get randomNumber => Random().nextInt(100);

String? dateFormatter(
    {required String date, String format = 'dd MMM yyyy hh:mm a'}) {
  try {
    final formatter = DateFormat(format);
    if (date.dateTime != null) return formatter.format(date.dateTime!);
    return null;
  } catch (e) {
    dev.log('err $date--- ${e.toString()}');
    return null;
  }
}
