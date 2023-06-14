import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';
import 'package:Monarch/app/widgets/forms/task_input_form.dart';
import '../../modules/add-member/set_assignees.dart';
import 'add_sub_icon.dart';
import 'calendar.dart';
import 'dashboard_add_project_sheet.dart';
import '../../core/values/values.dart';
import '../bottomsheets/bottom_sheet_holder.dart';
import '../bottomsheets/bottom_sheets.dart';

// ignore: must_be_immutable
class CreateTaskBottomSheet extends StatelessWidget {
  CreateTaskBottomSheet({Key? key}) : super(key: key);

  TextEditingController _taskNameController = new TextEditingController();
  String projectName = "HobNob - Mobile app  ";

  @override
  Widget build(BuildContext context) {
    var screenWidth = Get.width;
    return SingleChildScrollView(
      child: Column(children: [
        AppSpaces.verticalSpace10,
        BottomSheetHolder(),
        AppSpaces.verticalSpace10,
        Padding(
          padding: EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(children: [
              Icon(Icons.contacts, color: HexColor.fromHex("353645")),
              AppSpaces.horizontalSpace10,
              Text(projectName.toUpperCase(),
                  style: GoogleFonts.lato(
                      color: HexColor.fromHex("353645"),
                      shadows: [
                        Shadow(
                            color: Colors.black,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 0.5),
                      ],
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
              Icon(
                Icons.expand_more,
                color: HexColor.fromHex("353645"),
              ),
            ]),
            AppSpaces.verticalSpace20,
            /*TaskFormInput(
              placeholder: "Task Name ....",
              autofocus: true,
              keyboardType: "text",
              controller: _taskNameController,
              obscureText: false,
              label: "Task",
            ),*/
            AppSpaces.verticalSpace20,
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              InkWell(
                onTap: () {
                  Get.to(() => SetAssigneesScreen());
                },
                child: Row(
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
              ),
              SheetGoToCalendarWidget(
                cardBackgroundColor: HexColor.fromHex("FDA7FF"),
                textAccentColor: Colors.purpleAccent,
                value: 'Today 3:00PM',
                label: 'Due Date',
              )
            ]),
            // Spacer(),
            AppSpaces.verticalSpace20,

            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: screenWidth * 0.6,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BottomSheetIcon(icon: Icons.local_offer_outlined),
                      Transform.rotate(
                          angle: 195.2,
                          child: BottomSheetIcon(icon: Icons.attach_file)),
                      BottomSheetIcon(icon: FeatherIcons.flag),
                      BottomSheetIcon(icon: FeatherIcons.image)
                    ]),
              ),
              AddSubIcon(
                scale: 0.8,
                color: AppColors.primaryBackgroundColor,
                callback: _addProject,
              ),
            ])
          ]),
        ),
      ]),
    );
  }

void _addProject() {
    showAppBottomSheet(
      DashboardAddProjectSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }
}

class BottomSheetIcon extends StatelessWidget {
  final IconData icon;

  const BottomSheetIcon({
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: Colors.black,
      ),
      iconSize: 25,
      onPressed: null,
    );
  }
}
