import 'dart:io';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../dashboard/timeline.dart';
import '../../core/values/sizes.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/strings.dart';
import '../../widgets/container_label.dart';
import '../../core/utils/custom-painter.dart';
import '../../widgets/dummy/profile-img.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/navigation/back_button.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';
import 'package:Monarch/app/controllers/workspace/my_workspace.dart';

class NewWorkSpace extends StatelessWidget {
  final int? id;
  final String? token;

  NewWorkSpace({Key? key, this.id, this.token}) : super(key: key);

  MyWorkSpaceController myWorkSpaceController =
      Get.put(MyWorkSpaceController());

  final color = Color.fromRGBO(64, 105, 225, 1);

  @override
  Widget build(BuildContext context) {
    myWorkSpaceController.fetchUserDetails(id!);
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
    return Obx(() => myWorkSpaceController.loading.value
        ? const Center(
            child: const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2,
              ),
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
                left: 25.0,
                right: 25.0,
                top: sizeHeight * 0.1,
                bottom: sizeHeight * 0.1),
            child: Container(
              height: sizeHeight,
              width: sizeWidth,
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20.0)),
              padding: EdgeInsets.only(
                  left: 15.0, top: 15.0, right: 15.0, bottom: 20.0),
              child: SingleChildScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
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
                    verticalSpaceRegular,
                    titleTxt(),
                    verticalSpaceSmall,
                    emailTxt(),
                    verticalSpaceSmall,
                    designationTxt(),
                    verticalSpaceSmall,
                    empCodeTxt(),
                    verticalSpaceMedium,
                    totalMembersTxt(),
                    verticalSpaceRegular,
                    totalMemberVal(),
                    verticalSpaceRegular,
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
                            callback: () => Get.to(() => Timeline(token: token!,))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ));
  }

  Widget profileImg() {
    return ProfileImg(
        imgContainer: profileUpload(),
        buttonContainer: myWorkSpaceController.loading.value
            ? Align(
                alignment: Alignment.bottomRight,
                child: const SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2,
                  ),
                ),
              )
            : AppPrimaryButton(
                callback: () => myWorkSpaceController.uploadProfileImg(token!),
                buttonText: uploadProfileBttn,
                buttonHeight: 40,
                buttonWidth: sizeWidth * 0.35));
  }

  Widget profileUpload() {
    return myWorkSpaceController.loading.value
        ? Align(
            alignment: Alignment.center,
            child: const SizedBox(
              height: 25,
              width: 25,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2,
              ),
            ),
          )
        : Container(
            child: myWorkSpaceController.isImgPathSet.value != true
                ? GestureDetector(
                    onTap: () =>
                        myWorkSpaceController.getImage(ImageSource.gallery),
                    child: Stack(
                      children: [
                        ProfileDummyImg(
                            color: Colors.yellowAccent,
                            dummyType: ProfileDummyTypeImg.Image,
                            scale: 2.5,
                            image: profile_img),
                        Positioned(
                          child: buildEditIcon(color),
                          right: 3,
                          top: 6,
                        )
                      ],
                    ),
                  )
                : GestureDetector(
                    onTap: () =>
                        myWorkSpaceController.getImage(ImageSource.gallery),
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Container(
                          width: sizeHeight * 0.25,
                          height: sizeWidth * 0.25,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.blueGrey, width: 1),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: FileImage(
                                  File(myWorkSpaceController.imagePath.value)
                                ),
                              )),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(right: sizeWidth * 0.145, top: 8),
                          child: buildEditIcon(color),
                        ),
                      ],
                    ),
                  ),
          );
  }

  // Builds Edit Icon on Profile Picture
  Widget buildEditIcon(Color color) => buildCircle(
      all: 5,
      child: Icon(
        Icons.edit,
        color: color,
        size: 15,
      ));

  // Builds/Makes Circle for Edit Icon on Profile Picture
  Widget buildCircle({
    required Widget child,
    required double all,
  }) =>
      ClipOval(
          child: Container(
        padding: EdgeInsets.all(all),
        decoration: BoxDecoration(
            color: white,
            border: Border.all(color: Colors.white, width: 1),
            shape: BoxShape.circle),
        child: child,
      ));

  Widget skipButton() {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () => Get.to(() => Timeline(token: token!,)),
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
    return Text("${myWorkSpaceController.userModel?.name}$workspace_txt",
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

  Widget emailTxt() {
    return Text(
      myWorkSpaceController.userModel?.email ?? "",
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
