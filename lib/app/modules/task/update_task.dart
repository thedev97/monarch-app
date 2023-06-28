import 'package:Monarch/app/data/data_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/values/values.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/dropDown/customScrollBar.dart';
import '../../widgets/dropDown/expandSection.dart';
import '../../widgets/forms/task_input_form.dart';
import '../../widgets/navigation/default_back_button.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';

class UpdateTask extends StatefulWidget {
  const UpdateTask({Key? key}) : super(key: key);

  @override
  State<UpdateTask> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends State<UpdateTask> {
  String projectTitle = 'Project';
  bool isStrechedDropDown = false;

  TextEditingController _taskNameController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  TextEditingController _dueDateController = new TextEditingController();
  TextEditingController _commentController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(children: [
            buildHeaderBar(),
            editTaskText(),
            Padding(
              padding: EdgeInsets.only(top: sizeHeight * 0.12),
              child: ListView(
                children: [
                  titleField(),
                  AppSpaces.verticalSpace20,
                  projectList(),
                  AppSpaces.verticalSpace20,
                  dueDateTextField(),
                  AppSpaces.verticalSpace20,
                  projectDescText(),
                  AppSpaces.verticalSpace10,
                  descTextField(),
                  AppSpaces.verticalSpace20,
                  addPriorityText(),
                  AppSpaces.verticalSpace10,
                  priorityOfProject(),
                  AppSpaces.verticalSpace20,
                  addMemberText(),
                  AppSpaces.verticalSpace10,
                  membersList(),
                  Container(
                    height: 1,
                    width: sizeWidth,
                    color: Colors.black,
                  ),
                  AppSpaces.verticalSpace20,
                  taskTypeText(),
                  AppSpaces.verticalSpace10,
                  taskTypeOfProject(),
                  AppSpaces.verticalSpace30,
                  commentField(),
                ],
              ),
            ),
          ]),
        ),
      ),
      bottomNavigationBar: editTaskButton(),
    );
  }

  Widget buildHeaderBar() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: const DefaultBack(),
        ),
        InkWell(
          onTap: () {},
          child: ProfileDummyImg(
              color: HexColor.fromHex("93F0F0"),
              dummyType: ProfileDummyTypeImg.Image,
              image: profile_img,
              scale: 1),
        ),
      ],
    );
  }

  Widget editTaskText() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Text(editTaskTxt,
          style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              shadows: [
                Shadow(
                    color: Colors.black,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0),
              ],
              color: Colors.black)),
    );
  }

  Widget titleField() {
    return TaskFormInput(
      placeholder: "Task Title",
      autofocus: false,
      keyboardType: "text",
      controller: _taskNameController,
      obscureText: false,
    );
  }

  Widget projectDescText() {
    return Text(projectDescTxt,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black));
  }

  Widget descTextField() {
    return TextFormField(
      controller: _descController,
      minLines: 2,
      maxLines: 5,
      keyboardType: TextInputType.multiline,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black),
      decoration: InputDecoration(
        enabled: true,
        fillColor: textDescBackgroundColor.withOpacity(0.4),
        filled: true,
        hintText: 'Type here...',
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w800,
            fontSize: 10,
            color: Colors.black.withOpacity(0.5)),
        contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
      ),
    );
  }

  Widget dueDateTextField() {
    return TextFormField(
      controller: _dueDateController,
      keyboardType: TextInputType.none,
      autofocus: false,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black),
      onTap: () async {
        DateTime? datePicked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2025));
        if (datePicked != null) {
          _dueDateController.text =
              "${datePicked.day}-${datePicked.month}-${datePicked.year}";
        }
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 18,
        ),
        hintText: "Due Date",
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: Colors.black.withOpacity(0.5)),
        suffixIcon: Icon(
          FontAwesomeIcons.calendar,
          size: 15.0,
          color: HexColor.fromHex("3C3E49"),
        ),
        filled: false,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("3C3E49")),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: HexColor.fromHex("BEF0B2")),
        ),
        border:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      ),
    );
  }

  Widget addPriorityText() {
    return Text(priority,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black));
  }

  Widget addMemberText() {
    return Text(assigneeMem,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black));
  }

  Widget membersList() {
    return Transform.scale(
        alignment: Alignment.centerLeft,
        scale: 0.65,
        child: buildStackedImages());
  }

  Widget taskTypeText() {
    return Text(taskType,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black));
  }

  Widget projectText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(projectName,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w800,
                fontSize: 13,
                color: Colors.black.withOpacity(0.5))),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            isStrechedDropDown
                ? Icons.arrow_drop_up_sharp
                : Icons.arrow_drop_down_sharp,
            color: Colors.black.withOpacity(0.8),
            size: 25,
          ),
        ),
      ],
    );
  }

  Widget editTaskButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 85),
      child: AppPrimaryButton(
          buttonHeight: 40,
          buttonWidth: sizeWidth * 0.7,
          buttonText: editTaskBttn,
          callback: () => Get.back()),
    );
  }

  Widget projectList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isStrechedDropDown = !isStrechedDropDown;
            });
          },
          child: projectText(),
        ),
        AppSpaces.verticalSpace10,
        projectTitle != 'Project'
            ? Padding(
                padding: EdgeInsets.only(right: 10),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                      color: Color(0XFF001E88).withOpacity(0.25),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: InputChip(
                      avatar: CircleAvatar(
                        backgroundColor: HexColor.fromHex("#C53F3F"),
                        radius: 4,
                      ),
                      backgroundColor: Color(0XFF001E88).withOpacity(0.2),
                      label:
                          Text(projectTitle, style: AppTextStyles.chatMsgTwo),
                      onPressed: () => print(""),
                      deleteIconColor: primaryColor,
                      deleteIcon: Icon(
                        Icons.cancel,
                        size: 15,
                      ),
                      onDeleted: () => print(""),
                    ),
                  ),
                ),
              )
            : Container(),
        AppSpaces.verticalSpace10,
        Container(
          height: 1,
          width: sizeWidth,
          color: Colors.black,
        ),
        ListExpandSection(
          expand: isStrechedDropDown,
          isMember: true,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CustomScrollbar(
                  builder: (context, scrollController2) => ListView.builder(
                      padding: EdgeInsets.all(0),
                      controller: scrollController2,
                      shrinkWrap: true,
                      itemCount: AppData.addProjectList.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              projectTitle = AppData.addProjectList[index];
                              isStrechedDropDown = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            child: ListView(
                              physics: ScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              children: [
                                Text(AppData.addProjectList[index],
                                    style: AppTextStyles.chatMsgTwo),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget priorityOfProject() {
    final dynamic priorityData = AppData.priorityList;
    var priorityProject = List.generate(
      AppData.priorityList.length,
      (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 7, bottom: 10),
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: Color(0XFF001E88).withOpacity(0.25),
              border: Border.all(
                color: Colors.grey.withOpacity(0.4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InputChip(
              backgroundColor: Color(0XFF001E88).withOpacity(0.2),
              label: Text(priorityData[index], style: AppTextStyles.chatMsgTwo),
              onPressed: () => print(""),
            ),
          ),
        );
      },
    );
    return Wrap(children: [...priorityProject]);
  }

  Widget taskTypeOfProject() {
    final dynamic taskTypeData = AppData.taskTypeList;
    var taskTypeProject = List.generate(
      AppData.taskTypeList.length,
      (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: Color(0XFF001E88).withOpacity(0.25),
              border: Border.all(
                color: Colors.grey.withOpacity(0.4),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: InputChip(
              backgroundColor: Color(0XFF001E88).withOpacity(0.2),
              label: Text(taskTypeData[index], style: AppTextStyles.chatMsgTwo),
              onPressed: () => print(""),
            ),
          ),
        );
      },
    );
    return Wrap(children: [...taskTypeProject]);
  }

  Widget commentField() {
    return TaskFormInput(
      placeholder: comment,
      autofocus: false,
      keyboardType: "text",
      controller: _commentController,
      obscureText: false,
    );
  }
}
