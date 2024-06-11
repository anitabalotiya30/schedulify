import 'package:flutter/material.dart';
import 'package:schedulify/helper/extensions.dart';
import 'package:stacked/stacked.dart';

import '../../../helper/global.dart';
import 'my_activity_view_model.dart';
import 'tabs/bookmark_tab.dart';
import 'tabs/chart_tab.dart';
import 'tabs/home_tab.dart';
import 'tabs/perc_tab.dart';
import 'tabs/profile_tab.dart';

class MyActivityView extends StatelessWidget {
  const MyActivityView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyActivityViewModel>.nonReactive(
        viewModelBuilder: () => MyActivityViewModel(),
        builder: (context, viewModel, child) => Scaffold(
            backgroundColor: const Color(0XFF9381ff),

            //
            bottomNavigationBar: _BottomNavBar(viewModel: viewModel),

            //
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: const Color(0XFF9381ff),
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text('My Activity',
                  style: TextStyle(color: Colors.white)),

              //
              actions: [
                IconButton(
                    onPressed: viewModel.back, icon: const Icon(Icons.home)),
              ],
            ),

            //
            body: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: viewModel.pageC,
              itemCount: viewModel.navItems.length,

              //
              itemBuilder: (context, index) => [
                HomeTab(),
                const PercentageTab(),
                const ChartTab(),
                const BookmarkTab(),
                const ProfileTab()
              ][index],
            )));
  }
}

class _BottomNavBar extends StatelessWidget {
  final MyActivityViewModel viewModel;
  const _BottomNavBar({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: mq.height * .07,

        //
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(color: Colors.grey, offset: Offset(0, 1), blurRadius: 2.5)
        ]),

        //
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,

            //
            children: [
              ...[
                Icons.home,
                Icons.percent,
                Icons.bar_chart,
                Icons.bookmark,
                Icons.person
              ].mapIndexed((i, e) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,

                      //
                      children: [
                        //
                        GestureDetector(
                            onTap: () => viewModel.pageC.jumpToPage(i),
                            child: Icon(e))
                      ]))
            ]));
  }
}
