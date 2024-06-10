import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  // final dialogService = locator<DialogService>();
  // final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();

  void navigateToActivity() =>
      _navigationService.navigateTo(Routes.myActivityView,
          transition: TransitionsBuilders.moveInLeft);

  void navigateToSchedList() =>
      _navigationService.navigateTo(Routes.scheduleListView);

  final etText = TextEditingController();
  bool switchV = false;

  void onToggleSwitch(bool v) {
    switchV = v;
    notifyListeners();
  }

  // String get counterLabel => 'Counter is: $_counter';

  // int _counter = 0;

  // void incrementCounter() {
  //   _counter++;
  //   rebuildUi();
  // }

  // void showDialog() {
  //   _dialogService.showCustomDialog(
  //     variant: DialogType.infoAlert,
  //     title: 'Stacked Rocks!',
  //     description: 'Give stacked $_counter stars on Github',
  //   );
  // }

  // void showBottomSheet() {
  //   _bottomSheetService.showCustomSheet(
  //     variant: BottomSheetType.notice,
  //     title: ksHomeBottomSheetTitle,
  //     description: ksHomeBottomSheetDescription,
  //   );
  // }
}
