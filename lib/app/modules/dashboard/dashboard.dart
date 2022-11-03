import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dashboard-tab-screens/overview.dart';
import 'dashboard-tab-screens/productivity.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../../widgets/bottomsheets/bottom_sheets.dart';
import '../../widgets/bottomsheets/dashboard_settings_sheet.dart';
import '../../widgets/buttons/primary_tab_buttons.dart';
import '../../widgets/navigation/dasboard_nav.dart';
import '../../widgets/shapes/app_settings_icon.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);
  ValueNotifier<bool> _totalTaskTrigger = ValueNotifier(true);
  ValueNotifier<bool> _totalDueTrigger = ValueNotifier(false);
  ValueNotifier<bool> _totalCompletedTrigger = ValueNotifier(true);
  ValueNotifier<bool> _workingOnTrigger = ValueNotifier(false);
  ValueNotifier<int> _buttonTrigger = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              DashboardNav(
                icon: FontAwesomeIcons.comment,
                image: "assets/team-prof.png",
                notificationCount: "2",
                //page: ChatScreen(),
                title: "Dashboard",
                onImageTapped: () {
                  //Get.to(() => ProfileOverview());
                },
              ),
              AppSpaces.verticalSpace20,
              Text("Hello,\nSoumya 👋",
                  style: GoogleFonts.lato(
                    color: Colors.black,
                    fontSize: 40,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0),
                    ],
                    fontWeight: FontWeight.w800,
                  )),
              AppSpaces.verticalSpace20,
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                //tab indicators
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    PrimaryTabButton(
                        buttonText: "Overview",
                        itemIndex: 0,
                        notifier: _buttonTrigger),
                    PrimaryTabButton(
                        buttonText: "Productivity",
                        itemIndex: 1,
                        notifier: _buttonTrigger)
                  ],
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: AppSettingsIcon(
                      callback: () {
                        showAppBottomSheet(
                          DashboardSettingsBottomSheet(
                            totalTaskNotifier: _totalTaskTrigger,
                            totalDueNotifier: _totalDueTrigger,
                            workingOnNotifier: _workingOnTrigger,
                            totalCompletedNotifier: _totalCompletedTrigger,
                          ),
                        );
                      },
                    ))
              ]),
              AppSpaces.verticalSpace20,
              ValueListenableBuilder(
                  valueListenable: _buttonTrigger,
                  builder: (BuildContext context, _, __) {
                    return _buttonTrigger.value == 0
                        ? DashboardOverview()
                        : DashboardProductivity();
                  })
            ]),
          ),
        ));
  }
}
