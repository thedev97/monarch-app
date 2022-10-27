import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import '../../core/values/values.dart';
import '../../widgets/buttons/primary_progress_button.dart';
import '../../widgets/container_label.dart';
import '../../widgets/navigation/back.dart';
import '../../widgets/white-background/white-background.dart';
import 'choose_plan.dart';

class NewWorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = Get.width;
    var screenHeight = Get.height;
    return Scaffold(
      body: Stack(children: [
        WhiteBackground(
          color: HexColor.fromHex("#f8eee4"),
          position: "topLeft",
        ),
        Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: NavigationBack(),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text('New WorkSpace',
                          style: GoogleFonts.lato(
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 1.0),
                            ],
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: screenHeight <= 700 ? 30.0 : 38.0,
                          )),
                    ),
                    SizedBox(height: screenHeight*0.1,),
                    Expanded(
                        flex: 1,
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecorationStyles.fadingGlory,
                            child: Padding(
                              padding: EdgeInsets.all(3.0),
                              child: DecoratedBox(
                                  decoration:
                                      BoxDecorationStyles.fadingInnerDecor,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: SingleChildScrollView(
                                      physics: ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      child: Column(children: [
                                        ProfileDummyImg(
                                            color: Colors.yellowAccent,
                                            dummyType: ProfileDummyTypeImg.Image,
                                            scale: 2.5,
                                            image: "assets/team-prof.png"),
                                        AppSpaces.verticalSpace10,
                                        Text('Soumya\'s Workspace',
                                            style: GoogleFonts.lato(
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.black,
                                                      offset: Offset(0.0, 1.0),
                                                      blurRadius: 1.0),
                                                ],
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 30.0)),
                                        AppSpaces.verticalSpace10,
                                        Text(
                                            'Tap the logo to upload a new image.',
                                            style: GoogleFonts.lato(
                                                fontSize: 14,
                                                color:
                                                    HexColor.fromHex("666A7A"))),
                                        SizedBox(height: 50),
                                        ContainerLabel(
                                            label:
                                                'HOW MANY PEOPLE IN YOUR TEAM'),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('11 - 25',
                                                    style: GoogleFonts.lato(
                                                      color: Colors.black,
                                                      fontSize: 20,
                                                    )),
                                                RotatedBox(
                                                  quarterTurns: 1,
                                                  child: Icon(Icons.share,
                                                      color: Colors.black,
                                                      size: 25),
                                                )
                                              ]),
                                        ),
                                        AppSpaces.verticalSpace20,
                                        ContainerLabel(
                                            label:
                                                'INVITE PEOPLE TO YOUR WORKSPACE'),
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text('Email Address',
                                                    style: GoogleFonts.lato(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                    )),
                                                Icon(Icons.add,
                                                    color: Colors.black, size: 25)
                                              ]),
                                        ),
                                        AppSpaces.verticalSpace20,
                                      ]),
                                    ),
                                  )),
                            ))),
                  ]),
            )),
        Positioned(
            bottom: 30,
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 20),
              width: screenWidth,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Skip',
                        style: GoogleFonts.lato(
                            shadows: [
                              Shadow(
                                  color: Colors.black,
                                  offset: Offset(0.0, 1.0),
                                  blurRadius: 1.0),
                            ],
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black)),
                    PrimaryProgressButton(
                      width: 120,
                      label: "Next",
                      callback: () {
                        Get.to(() => ChoosePlan());
                      },
                    )
                  ]),
            ))
      ]),
    );
  }
}
