import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';
import '../../widgets/buttons/primary_progress_button.dart';
import '../../widgets/buttons/progress_card_close_button.dart';
import '../../widgets/container_label.dart';
import '../../widgets/profile/badged_container.dart';
import '../../widgets/profile/text_outlined_button.dart';

class ProfileOverview extends StatelessWidget {
  const ProfileOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = Get.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SafeArea(
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      physics: ScrollPhysics(),
                      child: Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.08),
                        child: Column(children: [
                          Align(
                            alignment: Alignment.center,
                            child: ProfileDummyImg(
                                color: HexColor.fromHex("94F0F1"),
                                dummyType: ProfileDummyTypeImg.Image,
                                scale: 3.0,
                                image: "assets/team-prof.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("SOUMYA RANJAN MISHRA",
                                style: AppTextStyles.header2),
                          ),
                          Text("SOUMYA.MISHRA@BLUEHEXSOFTWARE.COM",
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w400,
                                  color: HexColor.fromHex("3C3E49"),
                                  fontSize: 12)),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: OutlinedButtonWithText(
                              width: 150,
                              content: "View Profile",
                              onPressed: () {
                                //Get.to(() => ProfilePage());
                              },
                            ),
                          ),
                          AppSpaces.verticalSpace10,
                          ContainerLabel(label: "Workspace"),
                          AppSpaces.verticalSpace10,
                          Container(
                            width: double.infinity,
                            height: 90,
                            padding: EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  ...progressCardGradient,
                                ],
                              ),
                              border: Border.all(
                                  color: AppColors.primaryBackgroundColor),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  offset: Offset(0, 4), // Shadow position
                                ),
                              ],
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ProfileDummyImg(
                                            color: HexColor.fromHex("94F0F1"),
                                            dummyType:
                                                ProfileDummyTypeImg.Image,
                                            scale: 1.20,
                                            image: "assets/team-prof.png"),
                                        AppSpaces.horizontalSpace20,
                                        Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text("BLUEHEX ORGANIZATION",
                                                  style: GoogleFonts.lato(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: Colors.black,
                                                    shadows: [
                                                      Shadow(
                                                          color: Colors.black,
                                                          offset:
                                                              Offset(0.0, 1.0),
                                                          blurRadius: 1.0),
                                                    ],
                                                  )),
                                              SizedBox(height: 5),
                                              Text("soumya.mishra@bluehexsoftware.com",
                                                  style: GoogleFonts.lato(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 10,
                                                      color: HexColor.fromHex(
                                                          "5E6272")))
                                            ])
                                      ]),
                                  PrimaryProgressButton(
                                    width: 90,
                                    height: 40,
                                    label: "Invite",
                                    textStyle: GoogleFonts.lato(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ]),
                          ),
                          AppSpaces.verticalSpace20,
                          ContainerLabel(label: "Manage"),
                          AppSpaces.verticalSpace10,
                          Row(children: [
                            Expanded(
                              flex: 1,
                              child: BadgedContainer(
                                label: "MY TEAM",
                                value: "1 contacts",
                                badgeColor: "FDA5FF",
                                iconData: Icons.person_add_alt_1_sharp,
                                callback: () {
                                  //Get.to(() => MyTeams());
                                },
                              ),
                            ),
                            AppSpaces.horizontalSpace10,
                            Expanded(
                              flex: 1,
                              child: BadgedContainer(
                                label: "INBOX",
                                value: "No new updates",
                                badgeColor: "FFDE72",
                                iconData: Icons.inbox,
                              ),
                            )
                          ]),
                          AppSpaces.verticalSpace20,
                          Row(children: [
                            Expanded(
                              flex: 1,
                              child: BadgedContainer(
                                label: "SETTING",
                                value: "settings",
                                badgeColor: "FDA5FF",
                                iconData: Icons.settings,
                                callback: () {
                                  //Get.to(() => MyTeams());
                                },
                              ),
                            ),
                            AppSpaces.horizontalSpace10,
                            Expanded(
                              flex: 1,
                              child: BadgedContainer(
                                label: "SEARCH",
                                value: "docs & items",
                                badgeColor: "FFDE72",
                                iconData: Icons.search,
                              ),
                            )
                          ]),
                          AppSpaces.verticalSpace20,
                          BadgedContainer(
                            label: "SUPPORT & FEEDBACK",
                            value: "Support & Feedback",
                            badgeColor: "FDA5FF",
                            iconData: Icons.feedback,
                            callback: () {
                              //Get.to(() => MyTeams());
                            },
                          ),
                          AppSpaces.verticalSpace30,
                          Container(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyleOne.blueRounded,
                                child: Text('Log Out',
                                    style: GoogleFonts.lato(
                                        shadows: [
                                          Shadow(
                                              color: Colors.black,
                                              offset: Offset(0.0, 1.0),
                                              blurRadius: 1.0),
                                        ],
                                        fontWeight: FontWeight.w800,
                                        fontSize: 15,
                                        color: Colors.white))),
                          ),
                          SizedBox(height: 15,),
                          Text("Version 1.0",
                              style: GoogleFonts.lato(
                                  fontWeight:
                                  FontWeight.w700,
                                  fontSize: 12,
                                  color: HexColor.fromHex(
                                      "5E6272"))),
                          SizedBox(height: 15,),
                        ]),
                      )))),
          Positioned(
              top: 50,
              left: 20,
              child: Transform.scale(
                  scale: 1.2,
                  child: ProgressCardCloseButton(onPressed: () {
                    Get.back();
                  })))
        ]));
  }
}
