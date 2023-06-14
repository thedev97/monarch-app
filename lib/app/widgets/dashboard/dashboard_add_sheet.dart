import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/values/values.dart';
import '../../modules/task/task_due_date.dart';
import 'create_project.dart';
import 'create_task.dart';
import '../bottomsheets/bottom_sheet_holder.dart';
import '../bottomsheets/bottom_sheets.dart';
import '../onboarding/labelled_option.dart';

class DashboardAddBottomSheet extends StatelessWidget {
  const DashboardAddBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      AppSpaces.verticalSpace10,
      BottomSheetHolder(),
      AppSpaces.verticalSpace10,
      LabelledOption(
        label: 'Create Task',
        icon: Icons.add_to_queue,
        callback: _createTask,
      ),
      LabelledOption(
          label: 'Create Project',
          icon: Icons.device_hub,
          //callback: _createProject,
          ),
      LabelledOption(
          label: 'Create team',
          icon: Icons.people,
          callback: () {
            //Get.to(() => SelectMembersScreen());
          }),
      LabelledOption(
          label: 'Create Event',
          icon: Icons.fiber_smart_record,
          callback: () {
            Get.to(() => TaskDueDate());
          }),
    ]);
  }

  void _createTask() {
    showAppBottomSheet(
      CreateTaskBottomSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }

  /*void _createProject() {
    showAppBottomSheet(
      CreateProjectBottomSheet(),
      isScrollControlled: true,
      popAndShow: true,
    );
  }*/
}
