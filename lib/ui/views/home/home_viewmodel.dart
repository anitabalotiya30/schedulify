import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.dialogs.dart';
import '../../../app/app.locator.dart';
import '../../../app/app.router.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();

  void navigateToActivity() =>
      _navigationService.navigateTo(Routes.myActivityView,
          transition: TransitionsBuilders.moveInLeft);

  void navigateToSchedList() =>
      _navigationService.navigateTo(Routes.scheduleListView);

  void showDialog() {
    _dialogService.showCustomDialog(
        variant: DialogType.infoAlert,
        title: 'Are you sure?',
        description: 'Do your really want to delete this record?');
  }
}
