import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/values.dart';
import '../../widgets/buttons/primary_progress_button.dart';
import '../../widgets/navigation/back.dart';
import '../../widgets/onboarding/plan_card.dart';
import '../../widgets/onboarding/toggle_option.dart';
import '../../widgets/white-background/white-background.dart';

class ChoosePlan extends StatelessWidget {
  ChoosePlan({Key? key}) : super(key: key);

  ValueNotifier<bool> _multiUserTrigger = ValueNotifier(false);
  ValueNotifier<bool> _customLabelTrigger = ValueNotifier(false);
  ValueNotifier<int> _planContainerTrigger = ValueNotifier(0);

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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            AppSpaces.verticalSpace20,
            Expanded(
                flex: 1,
                child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecorationStyles.fadingGlory,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: DecoratedBox(
                          decoration: BoxDecorationStyles.fadingInnerDecor,
                          child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppSpaces.verticalSpace10,
                                  Text('Choose Plan',
                                      style: AppTextStyles.header2),
                                  AppSpaces.verticalSpace10,
                                  Text('Unlock all features with Premium Plan',
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          color: HexColor.fromHex("666A7A"))),
                                  AppSpaces.verticalSpace20,
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        PlanCard(
                                          notifierValue: _planContainerTrigger,
                                          selectedIndex: 0,
                                          header: "It's Free",
                                          subHeader: "For team from 1 - 10",
                                        ),
                                      ]),
                                  AppSpaces.verticalSpace20,
                                  Text('Enable Features',
                                      style: AppTextStyles.header2),
                                  AppSpaces.verticalSpace10,
                                  Container(
                                    width: screenWidth * 0.8,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                              text:
                                                  'You can customize the features in your workspace now. Or you can do it later in ',
                                              style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: HexColor.fromHex(
                                                      "666A7A")),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: 'Menu - Workspace',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.black))
                                              ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                  AppSpaces.verticalSpace20,
                                  ToggleLabelOption(
                                      label: '    Multiple Assignees',
                                      notifierValue: _multiUserTrigger,
                                      icon: Icons.groups),
                                  ToggleLabelOption(
                                      label: '    Custom Labels',
                                      notifierValue: _customLabelTrigger,
                                      icon: Icons.category)
                                ],
                              ))),
                    )))
          ]),
        ),
      ),
      Positioned(
          bottom: 20,
          child: Container(
            padding: EdgeInsets.only(left: 40, right: 20),
            width: screenWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Back',
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
                      label: "Done",
                      callback: () {
                        //Get.to(() => Timeline());
                      })
                ]),
          ))
    ]));
  }
}
