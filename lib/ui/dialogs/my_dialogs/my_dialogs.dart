import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:schedulify/ui/widgets/common/custom_loading.dart';
import 'package:stacked_services/stacked_services.dart';

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

  //show common progress
  // static void showProgressBar() => (const Center(
  //         child: CustomLoading(
  //       color: Colors.white,
  //     )));

  static void showProgressBar() => _dialogService.showCustomDialog(
        data: const CustomLoading(),
      );

  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }
}
