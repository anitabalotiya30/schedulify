import 'package:schedulify/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:schedulify/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:schedulify/ui/views/home/home_view.dart';
import 'package:schedulify/ui/views/my_activity/my_activity_view.dart';
import 'package:schedulify/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:schedulify/services/api_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    CustomRoute(
        page: MyActivityView,
        transitionsBuilder: TransitionsBuilders.moveInLeft)
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: ApiService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
