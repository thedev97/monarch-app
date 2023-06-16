import 'package:get/get.dart';
import '../../core/values/images.dart';
import 'package:flutter/material.dart';
import '../notification/notifications.dart';
import '../profile/profile_overview.dart';
import 'dashboard-tab-screens/overview.dart';
import '../../widgets/navigation/dasboard_nav.dart';
import '../../widgets/buttons/primary_tab_buttons.dart';
import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/core/values/strings.dart';
import 'dashboard-tab-screens/productivity.dart';
import 'package:Monarch/app/modules/chats/chat_screen.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(children: [
              dashboardNav(),
              selectionView(),
              projectViewSection(),
            ]),
          ),
        ));
  }

  Widget dashboardNav() {
    return DashboardNav(
      chatImg: chat_img,
      notifyImg: notify_img,
      image: profile_img,
      notificationCount: notificationCount,
      chatCount: chatCount,
      title: nameTxt,
      subTitle: pendingTask,
      onImageTapped: () {
        Get.to(() => ProfileOverview());
      },
      notificationPage: NotificationScreen(
        count: notificationCount,
      ),
      chatPage: ChatScreen(),
    );
  }

  Widget selectionView() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PrimaryTabButton(
              buttonText: overviewTxt, itemIndex: 0, notifier: _buttonTrigger),
          SizedBox(
            width: 20,
          ),
          PrimaryTabButton(
              buttonText: productivityViewTxt,
              itemIndex: 1,
              notifier: _buttonTrigger)
        ],
      ),
    );
  }

  Widget projectViewSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.18),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ValueListenableBuilder(
                valueListenable: _buttonTrigger,
                builder: (BuildContext context, _, __) {
                  return _buttonTrigger.value == 0
                      ? DashboardOverview()
                      : DashboardProductivity();
                }),
          ],
        ),
      ),
    );
  }
}
