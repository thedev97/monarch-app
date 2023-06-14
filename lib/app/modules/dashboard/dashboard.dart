import 'package:Monarch/app/modules/chats/chat_screen.dart';
import 'package:get/get.dart';

import '../../core/values/images.dart';
import 'package:flutter/material.dart';
import '../notification/notifications.dart';
import '../profile/profile_overview.dart';
import 'dashboard-tab-screens/overview.dart';
import '../../widgets/forms/search_box_form.dart';
import '../../widgets/navigation/dasboard_nav.dart';
import '../../widgets/shapes/app_settings_icon.dart';
import '../../widgets/buttons/primary_tab_buttons.dart';
import 'package:Monarch/app/core/values/sizes.dart';
import 'package:Monarch/app/core/values/strings.dart';
import 'dashboard-tab-screens/productivity.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  TextEditingController _searchController = new TextEditingController();
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  searchSection(),
                  settingMenu(),
                ],
              ),
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

  Widget searchSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Container(
        height: 50,
        width: sizeWidth * 0.72,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SearchBoxInput(
            placeholder: searchPlaceHolderTxt, controller: _searchController),
      ),
    );
  }

  Widget settingMenu() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: AppSettingsIcon(
        callback: () {
          /*showAppBottomSheet(
            DashboardSettingsBottomSheet(
              totalTaskNotifier: _totalTaskTrigger,
              totalDueNotifier: _totalDueTrigger,
              workingOnNotifier: _workingOnTrigger,
              totalCompletedNotifier: _totalCompletedTrigger,
            ),
          );*/
        },
      ),
    );
  }

  Widget selectionView() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.15, left: 20),
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
      padding: EdgeInsets.only(top: sizeHeight * 0.25),
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
                  /* return _buttonTrigger.value == 0
                      ? DashboardOverview() : Container();*/
                }),
          ],
        ),
      ),
    );
  }
}
