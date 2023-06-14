import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/values/values.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/dropDown/drop-down.dart';
import '../../widgets/forms/task_input_form.dart';
import '../../widgets/navigation/default_back_button.dart';
import 'package:Monarch/app/widgets/dummy/profile_dummy_img.dart';

class CreateProjectScreen extends StatelessWidget {
  CreateProjectScreen({Key? key}) : super(key: key);

  TextEditingController _projectNameController = new TextEditingController();
  TextEditingController _descController = new TextEditingController();
  TextEditingController _categoryController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(children: [
              buildHeaderBar(),
              addProjectText(),
              Padding(
                padding: EdgeInsets.only(top: sizeHeight * 0.12),
                child: ListView(
                  children: [
                    titleField(),
                    AppSpaces.verticalSpace20,
                    projectDescText(),
                    AppSpaces.verticalSpace10,
                    descTextField(),
                    AppSpaces.verticalSpace20,
                    categoryField(),
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
                    colorText(),
                  ],
                ),
              ),
              colorList(),
            ]),
          ),
        ),
      bottomNavigationBar: createProjectButton(),
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

  Widget addProjectText() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Text(addProjectTxt,
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
      placeholder: "Project Title",
      autofocus: false,
      keyboardType: "text",
      controller: _projectNameController,
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

  Widget categoryField() {
    return TaskFormInput(
      placeholder: "Category",
      autofocus: false,
      keyboardType: "text",
      controller: _categoryController,
      obscureText: false,
    );
  }

  Widget addMemberText() {
    return Text(addMemTxt,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black));
  }

  Widget membersList() {
    return Transform.scale(
        alignment: Alignment.centerLeft,
        scale: 0.65,
        child: buildStackedImages());
  }

  Widget colorText() {
    return Text(selColorTxt,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w700, fontSize: 12, color: Colors.black));
  }

  Widget colorList() {
   return Padding(
     padding: EdgeInsets.only(top: sizeHeight*0.68),
     child: ColorDropDown(
       onChanged: (value){

       },
       label: "Text",
       height: 40,
       width: 40,
     ),
   );
  }

  Widget createProjectButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 85),
      child: AppPrimaryButton(
          buttonHeight: 40,
          buttonWidth: sizeWidth * 0.7,
          buttonText: createButton,
          callback: () => Get.back()),
    );
  }
}
