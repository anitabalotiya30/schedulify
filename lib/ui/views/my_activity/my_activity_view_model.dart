import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class MyActivityViewModel extends BaseViewModel {
  final _navServices = locator<NavigationService>();

  void back() => _navServices.back();
}
