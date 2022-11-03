import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/widgets/forms/task_input_form.dart';
import '../../core/constants.dart';
import '../../core/values/values.dart';
import '../bottomsheets/bottom_sheet_holder.dart';
import '../chats/badged_title.dart';
import 'in_bottomsheet_subtitle.dart';

class DashboardAddProjectSheet extends StatelessWidget {
  TextEditingController _projectNameController = new TextEditingController();

  DashboardAddProjectSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        AppSpaces.verticalSpace10,
        BottomSheetHolder(),
        AppSpaces.verticalSpace10,
        Padding(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              TaskFormInput(
                placeholder: "Sub Task Name ....",
                autofocus: true,
                keyboardType: "text",
                controller: _projectNameController,
                obscureText: false,
                label: "Sub Task",
              ),
              AppSpaces.verticalSpace20,
              /*InBottomSheetSubtitle(title: "SELECT LAYOUT"),
              AppSpaces.verticalSpace10,*/
             /* Container(
                  width: double.infinity,
                  height: 60,
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: HexColor.fromHex("181A1F")),
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: RectPrimaryButtonWithIcon(
                          buttonText: "List",
                          icon: Icons.checklist,
                          itemIndex: 0,
                          notifier: _settingsButtonTrigger),
                    ),
                    Expanded(
                      flex: 1,
                      child: RectPrimaryButtonWithIcon(
                          buttonText: "Board",
                          icon: Icons.checklist,
                          itemIndex: 1,
                          notifier: _settingsButtonTrigger),
                    )
                  ])),
              AppSpaces.verticalSpace20,*/
              Row(children: [
                BadgedTitle(
                  title: "HOBNOB - MOBILE",
                  color: 'FCA3FF',
                  number: '6',
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 20, color: Colors.black),
                  onPressed: () {},
                )
              ]),
              AppSpaces.verticalSpace10,
              Transform.scale(
                  scale: 0.8,
                  alignment: Alignment.centerLeft,
                  child: buildStackedImages(numberOfMembers: "2")),
              AppSpaces.verticalSpace20,
              InBottomSheetSubtitle(title: "PRIVACY"),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Row(
                  children: [
                    Text("Public to HOBNOB Team  ",
                        style: GoogleFonts.lato(
                            color: HexColor.fromHex("353645"),
                            fontSize: 16,
                            fontWeight: FontWeight.w800)),
                    Icon(Icons.expand_more, color: Colors.black),
                  ],
                ),
                /* AddSubIcon(
                  scale: 0.8,
                  color: AppColors.primaryAccentColor,
                  callback: _addMeeting,
                ),*/
              ]),
            ]))
      ]),
    );
  }

/*  void _addMeeting() {
    showAppBottomSheet(
      DashboardDesignMeetingSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }*/
}
