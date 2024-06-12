// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedDialogGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import '../ui/widgets/common/custom_loading.dart';
import 'app.locator.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';

enum DialogType { infoAlert, loading }

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<DialogType, DialogBuilder> builders = {
    //
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),

    // for loading
    DialogType.loading: (context, request, completer) => const Dialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        child: CustomLoading())
  };

  dialogService.registerCustomDialogBuilders(builders);
}
