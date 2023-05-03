import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/bottomsheets/bottom_sheets.dart';
import '../../widgets/dashboard/calendar.dart';
import '../../widgets/dashboard/in_bottomsheet_subtitle.dart';
import '../../widgets/forms/task_input_form.dart';
import '../../widgets/forms/text_input_unlabelled.dart';
import '../../widgets/navigation/back_button.dart';
import '../../widgets/notification/notification_card.dart';
import '../../widgets/projects/project_badge.dart';
import '../../widgets/projects/project_selectable_container.dart';

class CreateProjectScreen extends StatelessWidget {
  CreateProjectScreen({Key? key}) : super(key: key);

  TextEditingController _postController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dynamic notificationData = AppData.notificationMentions;
    var screenWidth = Get.width;
    var screenHeight = Get.height;
    List<Widget> notificationCards = List.generate(
        2,
        (index) => NotificationCard(
              read: notificationData[index]['read'],
              userName: notificationData[index]['mentionedBy'],
              date: notificationData[index]['date'],
              image: notificationData[index]['profileImage'],
              mentioned: notificationData[index]['hashTagPresent'],
              message: notificationData[index]['message'],
              mention: notificationData[index]['mentionedIn'],
              imageBackground: notificationData[index]['color'],
              userOnline: notificationData[index]['userOnline'],
            ));
    return Scaffold(
        backgroundColor: Color(0xff202427),
        body: Stack(children: [
          Padding(
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: screenHeight * 0.12),
            child: ListView(children: [
              Text("Edit Project",
                  style: GoogleFonts.lato(
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0),
                    ],
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: screenHeight <= 700 ? 30.0 : 38.0,
                  )),
              AppSpaces.verticalSpace30,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ProfileDummyImg(
                                  color: HexColor.fromHex("94F0F1"),
                                  dummyType: ProfileDummyTypeImg.Image,
                                  scale: 1.5,
                                  image: "assets/team-prof.png"),
                              AppSpaces.horizontalSpace10,
                              CircularCardLabel(
                                label: 'Assigned to',
                                value: 'Soumya Ranjan',
                                color: HexColor.fromHex("3C3E49"),
                              )
                            ]),
                        SheetGoToCalendarWidget(
                          cardBackgroundColor: HexColor.fromHex("FDA7FF"),
                          textAccentColor: Colors.purpleAccent,
                          value: 'Nov 07',
                          label: 'Due Date',
                        ),
                      ]),
                  AppSpaces.verticalSpace20,
                  Row(
                    children: [
                      ColouredProjectBadge(
                          color: "A06AFA", category: "Task List"),
                      AppSpaces.horizontalSpace20,
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("HOBNOB-MOBILE APP",
                                style: GoogleFonts.lato(
                                    color: HexColor.fromHex("353645"),
                                    shadows: [
                                      Shadow(
                                          color: Colors.black,
                                          offset: Offset(0.0, 0.5),
                                          blurRadius: 0.5),
                                    ],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(height: 5),
                            Text("TASK LIST",
                                style: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: HexColor.fromHex("626777"))),
                          ])
                    ],
                  ),
                ],
              ),
              AppSpaces.verticalSpace20,
              InBottomSheetSubtitle(
                title: "DESCRIPTION",
                textStyle: GoogleFonts.lato(
                    color: HexColor.fromHex("626777"),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              AppSpaces.verticalSpace10,
              InBottomSheetSubtitle(
                  title:
                      "Bima Garage is a healthcare-insurance startup aimed to "
                      "bring the much needed transparency to the Indian insurance industry. "
                      "Through our experts-led approach, we provide claim services to hospitals, "
                      "insurance agents and the insurance policyholders across India. For more info, "
                      "visit our website https://bimagarage.com. "
                      "HobNob by Bima Garage is India's first-of-its-kind platform "
                      "that provides policy-claim related insurance services "
                      "to all the insurance policyholders.",
                  textStyle: GoogleFonts.lato(
                      fontSize: 14, color: HexColor.fromHex("626777"))),
              AppSpaces.verticalSpace20,
              InBottomSheetSubtitle(
                  title: "CREATIVE WORKFLOW",
                textStyle: GoogleFonts.lato(
                    color: HexColor.fromHex("626777"),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),),
              AppSpaces.verticalSpace20,
              ProjectSelectableContainer(
                activated: false,
                header: "UI & FUNCTIONALITY TASK",
              ),
              ProjectSelectableContainer(
                activated: true,
                header: "API TASK",
              ),
              AppSpaces.verticalSpace10,
              TextFormInputUnlabelled(
                placeholder: "Comments ....",
                autofocus: false,
                keyboardType: "multiline",
                controller: _postController,
                obscureText: false,
              ),
              AppSpaces.verticalSpace20,
              ...notificationCards
            ]),
          ),
          Positioned(
            top: 0,
            child: Container(
              child: ClipRect(
                child: new BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 20),
                  child: Container(
                    width: screenWidth,
                    padding: EdgeInsets.all(20),
                    height: 110.0,
                    decoration: new BoxDecoration(
                      color: Colors.black.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppBackButton(horizontalIcon: false),
                            Expanded(
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                  IconButton(
                                    icon: Icon(Icons.done),
                                    color: Colors.black,
                                    iconSize: 25,
                                    onPressed: () {},
                                  ),
                                  AppSpaces.horizontalSpace10,
                                 /* IconButton(
                                    icon: Icon(Icons.dns_outlined),
                                    color: Colors.black,
                                    iconSize: 25,
                                    onPressed: () {},
                                  ),
                                  AppSpaces.horizontalSpace10,*/
                                  IconButton(
                                    icon: Icon(Icons.thumb_up_outlined),
                                    color: Colors.black,
                                    iconSize: 25,
                                    onPressed: () {},
                                  ),
                                  AppSpaces.horizontalSpace10,
                                  IconButton(
                                    icon: Icon(Icons.more_horiz),
                                    color: Colors.black,
                                    iconSize: 25,
                                    onPressed: () {
                                      showSettingsBottomSheet();
                                    },
                                  )
                                ]))
                          ]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]));
  }
}
