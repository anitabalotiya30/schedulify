import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';

class MyActivityViewModel extends BaseViewModel {
  final _navServices = locator<NavigationService>();
  final scrollC = ScrollController();
  final pageC = PageController();
  bool visible = false;

  final navItems = [
    Icons.home,
    Icons.percent,
    Icons.bar_chart,
    Icons.bookmark,
    Icons.person
  ];

  void back() => _navServices.back();

  void navigateToPage(int i) => pageC.jumpToPage(i);
}
