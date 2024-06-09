import 'package:flutter/material.dart';
import 'package:schedulify/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../widgets/common/custom_loading.dart';
import '../../widgets/common/logo.dart';

// class StartupView extends StackedView<StartupViewModel> {
//   const StartupView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//     BuildContext context,
//     StartupViewModel viewModel,
//     Widget? child,
//   ) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               'STACKED',
//               style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text('Loading ...', style: TextStyle(fontSize: 16)),
//                 horizontalSpaceSmall,
//                 SizedBox(
//                   width: 16,
//                   height: 16,
//                   child: CircularProgressIndicator(
//                     color: Colors.black,
//                     strokeWidth: 6,
//                   ),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   StartupViewModel viewModelBuilder(
//     BuildContext context,
//   ) =>
//       StartupViewModel();

//   @override
//   void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
//       .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
// }

class StartupView extends StatefulWidget {
  const StartupView({super.key});

  @override
  State<StartupView> createState() => _StartupViewState();
}

class _StartupViewState extends State<StartupView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),

      // This is where you can make decisions on where your app should navigate when
      // you have custom startup logic
      () => locator<NavigationService>().replaceWithHomeView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      //
      body: SizedBox(
        width: double.maxFinite,

        //
        child: Column(
          children: [
            Spacer(flex: 2),

            // logo
            Logo(height: 150),

            Spacer(),

            // loading
            CustomLoading(
              color: Colors.black,
            ),

            Spacer(),
          ],
        ),
      ),
    );

    // const Scaffold(
    //   body: Center(
    //     child: Column(
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         Text(
    //           'STACKED',
    //           style: TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
    //         ),
    //         Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             Text('Loading ...', style: TextStyle(fontSize: 16)),
    //             horizontalSpaceSmall,
    //             SizedBox(
    //               width: 16,
    //               height: 16,
    //               child: CircularProgressIndicator(
    //                 color: Colors.black,
    //                 strokeWidth: 6,
    //               ),
    //             )
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
