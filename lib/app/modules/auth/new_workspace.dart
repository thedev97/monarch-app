import 'package:get/get.dart';
import '../../core/commons.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/utils/custom-painter.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/container_label.dart';
import '../../widgets/dummy/profile_dummy_img.dart';
import '../../widgets/navigation/back_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/modules/dashboard/dashboard.dart';

class NewWorkSpace extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            backgroundPainter(),
            workspaceContainer(),
          ]),
        ));
  }

  Widget backgroundPainter() {
    return CustomPaint(
      painter: Painter(),
      child: Container(),
    );
  }

  Widget workspaceContainer() {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.0, right: 25.0, top: 60.0, bottom: 60.0),
      child: Container(
        height: sizeHeight,
        width: sizeWidth,
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(20.0)),
        padding:
            EdgeInsets.only(left: 15.0, top: 25.0, right: 15.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpaceSmall,
            Align(
              alignment: Alignment.topLeft,
              child: AppBackButton(
                horizontalIcon: false,
              ),
            ),
            verticalSpaceRegular,
            profileImg(),
            verticalSpaceMedium,
            titleTxt(),
            verticalSpaceSmall,
            designationTxt(),
            verticalSpaceSmall,
            empCodeTxt(),
            verticalSpaceMedium,
            totalMembersTxt(),
            verticalSpaceRegular,
            totalMemberVal(),
            verticalSpaceMedium,
            inviteMembersTxt(),
            verticalSpaceRegular,
            inviteMembers(),
            verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                skipButton(),
                AppPrimaryButton(
                    buttonHeight: 40,
                    buttonWidth: sizeWidth * 0.35,
                    buttonText: next_button,
                    callback: () => Get.to(() => Dashboard())),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profileImg() {
    return ProfileDummyImg(
        color: Colors.yellowAccent,
        dummyType: ProfileDummyTypeImg.Image,
        scale: 2.5,
        image: profile_img);
  }

  Widget skipButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () => Get.to(() => Dashboard()),
        child: Text(skip_button,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 0.5),
                      blurRadius: 0.5),
                ],
                color: Colors.black)),
      ),
    );
  }

  Widget titleTxt() {
    return Text(workspace_txt,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
            color: Colors.black));
  }

  Widget designationTxt() {
    return Text(
      designation,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
                color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
          ],
          fontSize: 12,
          color: Colors.black.withOpacity(0.8)),
    );
  }

  Widget empCodeTxt() {
    return Text(
      emp_code,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500,
          shadows: [
            Shadow(
                color: Colors.black, offset: Offset(0.0, 0.2), blurRadius: 0.2),
          ],
          fontSize: 12,
          color: Colors.black.withOpacity(0.8)),
    );
  }

  Widget totalMembersTxt() {
    return ContainerLabel(label: total_members_txt);
  }

  Widget totalMemberVal() {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(total_members_value,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 0.2),
                    blurRadius: 0.2),
              ],
              color: Colors.black)),
    );
  }

  Widget inviteMembersTxt() {
    return ContainerLabel(label: invite_members_txt);
  }

  Widget inviteMembers() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(email_address_txt,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 13,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 0.2),
                    blurRadius: 0.2),
              ],
              color: email_address_color)),
      Icon(Icons.add, color: Colors.black, size: 25)
    ]);
  }
}
