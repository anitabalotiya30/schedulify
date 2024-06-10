import 'package:flutter/material.dart';

import '../../../app/app.router.dart';

class DateTimePickerDialog {
  // default theme
  ThemeData get _defaultThemeData => ThemeData.light().copyWith(
        splashColor: Colors.transparent,
        dialogBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch(backgroundColor: Colors.white),
      );

  Future<String?> datePicker() async {
    DateTime? selectedDate = await showDatePicker(
      context: Routes.context!,
      keyboardType: TextInputType.datetime,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),

      // setting theme to datePicker
      builder: (ctx, child) => Theme(
        data: _defaultThemeData,
        child: child!,
      ),
    );

    if (selectedDate != null) {
      return selectedDate.toString().split(' ')[0];
    }
    return null;
  }

  Future<String?> timePicker() async {
    final selectedTime = await showTimePicker(
      context: Routes.context!,
      initialTime: TimeOfDay.now(),

      // setting theme to timePicker
      builder: (context, child) {
        return Theme(
          data: _defaultThemeData,
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      return '${selectedTime.hour}:${selectedTime.minute} ${selectedTime.period.name}';
    }
    return null;
  }
}
