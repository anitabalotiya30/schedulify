import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';
import '../../common/app_colors.dart';

class MyDialogs {
  static final _dialogService = locator<DialogService>();

  //show snackbar
  static void showSnackbar(final SnackBar snackBar) {
    try {
      ScaffoldMessenger.of(Routes.context!).showSnackBar(snackBar);
    } catch (e) {
      log('_showSnackbar: $e');
    }
  }

  //error
  static void error({required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.redAccent.withOpacity(.8),
    );

    showSnackbar(snackBar);
  }

  //success
  static void success({required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: kcPrimaryColor,
    );

    showSnackbar(snackBar);
  }

  //info
  static void info({required String msg}) {
    final snackBar = SnackBar(
      content: Text(
        msg,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: kcPrimaryColor,
    );

    showSnackbar(snackBar);
  }

  static void showProgressBar() =>
      _dialogService.showCustomDialog(variant: DialogType.loading);
}
