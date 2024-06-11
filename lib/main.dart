import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app/app.bottomsheets.dart';
import 'app/app.dialogs.dart';
import 'app/app.locator.dart';
import 'app/app.router.dart';
import 'helper/global.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  //enter full-screen
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(const MainApp());

  //for setting orientation to portrait only
  // await SystemChrome.setPreferredOrientations(
  //         [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
  //     .then((value) => runApp(const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.sizeOf(context);

    //
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,

      //
      initialRoute: Routes.startupView,
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      navigatorObservers: [
        StackedService.routeObserver,
      ],

      // setting default app theme
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'Lato',

        // set default appbar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),

          //
          titleTextStyle: TextStyle(
              fontSize: 19, fontWeight: FontWeight.w500, color: Colors.black),
        ),

        // setting default theme to textField
        inputDecorationTheme: const InputDecorationTheme(
          isDense: true,
          filled: true,
          fillColor: Color(0XFFf8f9fa),

          //
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black26),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
