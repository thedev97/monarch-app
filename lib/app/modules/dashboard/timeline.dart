import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import '../../core/constants.dart';
import '../../widgets/background/main-background.dart';
import 'dashboard.dart';
import '../../core/values/values.dart';

class Timeline extends StatefulWidget {
  Timeline({Key? key}) : super(key: key);

  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  ValueNotifier<int> bottomNavigatorTrigger = ValueNotifier(0);

  StatelessWidget currentScreen = Dashboard();

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor.fromHex("#ffffff"),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(children: [
          MainBackground(
            color: HexColor.fromHex("#ffffff"),
            position: "topLeft",
          ),
          ValueListenableBuilder(
              valueListenable: bottomNavigatorTrigger,
              builder: (BuildContext context, _, __) {
                return PageStorage(
                    child: dashBoardScreens[bottomNavigatorTrigger.value],
                    bucket: bucket);
              })
        ]),
        bottomNavigationBar: Container(
            width: double.infinity,
            height: 80,
            padding: EdgeInsets.only(top: 15, right: 30, left: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: Colors.teal.withOpacity(0.8)),
            child: GNav(
                haptic: true,
                tabBorderRadius: 10,
                tabActiveBorder: Border.all(color: Colors.black54, width: 2),
                curve: Curves.easeOutExpo,
                duration: Duration(microseconds: 20),
                gap: 10,
                color: Colors.white,
                activeColor: Colors.black,
                iconSize: 24,
                tabBackgroundColor: Colors.greenAccent,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                textStyle: GoogleFonts.lato(color: HexColor.fromHex("676979")),
                onTabChange: (index) {
                  bottomNavigatorTrigger.value = index;
                },
                tabs: [
                  GButton(
                    icon: Icons.widgets,
                    text: 'Home',
                  ),
                  GButton(
                    icon: FeatherIcons.clipboard,
                    text: 'Project',
                  ),
                  GButton(
                    icon: FeatherIcons.bell,
                    text: 'Notification',
                  ),
                  GButton(
                    icon: FeatherIcons.search,
                    text: 'Search',
                  )
                ])));
  }
}
