import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_management_tool/app/widgets/dummy/profile_dummy_img.dart';
import 'package:project_management_tool/app/widgets/forms/task_input_form.dart';
import '../../modules/projects/create_project.dart';
import '../../modules/task/set_assignees.dart';
import '../buttons/primary_progress_button.dart';
import 'calendar.dart';
import '../../core/values/values.dart';
import '../bottomsheets/bottom_sheet_holder.dart';

// ignore: must_be_immutable
class CreateProjectBottomSheet extends StatelessWidget {
  CreateProjectBottomSheet({Key? key}) : super(key: key);

  TextEditingController _projectNameController = new TextEditingController();
  TextEditingController _projectDesController = new TextEditingController();
  String projectName = "HobNob - Mobile app  ";

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        AppSpaces.verticalSpace20,
        BottomSheetHolder(),
        AppSpaces.verticalSpace10,
        Padding(
          padding: EdgeInsets.all(20),
          child:
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            TaskFormInput(
              placeholder: "Project Name ....",
              autofocus: true,
              keyboardType: "text",
              controller: _projectNameController,
              obscureText: false,
              label: "Project",
            ),
            AppSpaces.verticalSpace20,
            TaskFormInput(
              placeholder: "Project Description ....",
              autofocus: true,
              keyboardType: "multiline",
              controller: _projectDesController,
              obscureText: false,
              label: "Description",
            ),
            AppSpaces.verticalSpace30,
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
            AppSpaces.verticalSpace20,
            Align(
              alignment: Alignment.bottomRight,
              child: PrimaryProgressButton(
                width: 120,
                label: "Next",
                callback: () {
                  Get.to(() => CreateProjectScreen());
                },
              ),
            ),
          ]),
        ),
      ]),
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