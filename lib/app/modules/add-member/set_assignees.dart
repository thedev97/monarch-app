import 'package:Monarch/app/widgets/buttons/primary_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/values/colors.dart';
import '../../core/values/images.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../core/values/values.dart';
import '../../data/data_model.dart';
import '../../widgets/buttons/circular_button.dart';
import '../../widgets/dummy/profile_dummy_img.dart';
import '../../widgets/employee-card/employee_card.dart';
import '../../widgets/forms/search_box_form.dart';
import '../../widgets/forms/task_input_form.dart';
import '../../widgets/navigation/default_back_button.dart';

class SetAssigneesScreen extends StatefulWidget {
  const SetAssigneesScreen({Key? key}) : super(key: key);

  @override
  State<SetAssigneesScreen> createState() => _SetAssigneesScreenState();
}

class _SetAssigneesScreenState extends State<SetAssigneesScreen> {
  String empDesignation = "";
  bool isCreateMember = false;
  bool isCreateTeam = false;

  TextEditingController _searchController = new TextEditingController();
  TextEditingController _memNameController = new TextEditingController();
  TextEditingController _memDesignationController = new TextEditingController();
  TextEditingController _memEmailController = new TextEditingController();
  TextEditingController _teamController = new TextEditingController();
  TextEditingController _teamNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(children: [
            buildHeaderBar(),
            addMembersText(),
            searchSection(),
            Padding(
              padding: EdgeInsets.only(top: sizeHeight * 0.22),
              child: ListView(
                children: [
                  setDevMembersList(),
                  AppSpaces.verticalSpace10,
                  setAdminMembersList(),
                ],
              ),
            )
          ]),
        ),
      ),
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

  Widget addMembersText() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.08),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(membersTxt,
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
          AppSpaces.horizontalSpace10,
          CircularButton(
              buttonHeight: 30,
              buttonWidth: 30,
              buttonText: cont_button,
              callback: (){
                setState(() {
                  isCreateMember = true;
                });
                Future.delayed(Duration(milliseconds: 200), () async {
                  addMemberDialog(context);
                });
              })
        ],
      ),
    );
  }

  Widget searchSection() {
    return Padding(
      padding: EdgeInsets.only(top: sizeHeight * 0.14),
      child: Container(
        height: 50,
        width: sizeWidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: SearchBoxInput(
            placeholder: searchPlaceHolderTxt, controller: _searchController),
      ),
    );
  }

  Widget setDevMembersList() {
    final dynamic data = AppData.employeeDevData;
    List<Widget> cards = List.generate(AppData.employeeDevData.length, (index) {
      empDesignation = data[index]['designation'];
      return EmployeeCard(
        activated: data[index]['activated'],
        employeeImage: data[index]['employeeImage'],
        employeeName: data[index]['employeeName'],
        backgroundColor: data[index]["color"],
        employeePosition: data[index]["employeePosition"],
      );
    });
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(empDesignation,
            style: GoogleFonts.lato(
                color: Colors.black,
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0.0, 0.5),
                      blurRadius: 0.5),
                ],
                fontWeight: FontWeight.w700,
                fontSize: 13)),
        AppSpaces.verticalSpace10,
        ...cards,
      ]),
    );
  }

  Widget setAdminMembersList() {
    final dynamic data = AppData.employeeAdminData;
    List<Widget> cards =
        List.generate(AppData.employeeAdminData.length, (index) {
      empDesignation = data[index]['designation'];
      return EmployeeCard(
        activated: data[index]['activated'],
        employeeImage: data[index]['employeeImage'],
        employeeName: data[index]['employeeName'],
        backgroundColor: data[index]["color"],
        employeePosition: data[index]["employeePosition"],
      );
    });
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(empDesignation,
            style: GoogleFonts.lato(
                color: Colors.black,
                shadows: [
                  Shadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: Offset(0.0, 0.5),
                      blurRadius: 0.5),
                ],
                fontWeight: FontWeight.w700,
                fontSize: 13)),
        AppSpaces.verticalSpace10,
        ...cards,
      ]),
    );
  }

  // Show Dialog For Add Member
  Future addMemberDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: Text(
                                  addMemberTxt,
                                  style: AppTextStyles.header,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  try {
                                    Get.back();
                                  } catch (exception) {
                                    print(exception);
                                  }
                                },
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                      color: primaryColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 1)),
                                  child: Icon(
                                    Icons.close_sharp,
                                    size: 15.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppSpaces.verticalSpace10,
                          memNameField(),
                          AppSpaces.verticalSpace10,
                          memEmailField(),
                          AppSpaces.verticalSpace10,
                          memDesignationField(),
                          AppSpaces.verticalSpace10,
                          teamTextField(),
                          AppSpaces.verticalSpace30,
                          createMember(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget memNameField() {
    return TaskFormInput(
      placeholder: "Name",
      autofocus: false,
      keyboardType: "text",
      controller: _memNameController,
      obscureText: false,
    );
  }

  Widget memEmailField() {
    return TaskFormInput(
      placeholder: "Email Id",
      autofocus: false,
      keyboardType: "text",
      controller: _memEmailController,
      obscureText: false,
    );
  }

  Widget memDesignationField() {
    return TaskFormInput(
      placeholder: "Designation",
      autofocus: false,
      keyboardType: "text",
      controller: _memDesignationController,
      obscureText: false,
    );
  }

  Widget teamTextField() {
    return TextFormField(
      controller: _teamController,
      keyboardType: TextInputType.none,
      autofocus: false,
      style: GoogleFonts.lato(
          fontWeight: FontWeight.w500, fontSize: 13, color: Colors.black),
      onTap: () async {},
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 18,
        ),
        hintText: teamTxt,
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w800,
            fontSize: 13,
            color: Colors.black.withOpacity(0.5)),
        suffix: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: (){
              setState(() {
                isCreateTeam = true;
              });
              Future.delayed(Duration(milliseconds: 200), () async {
                addTeamDialog(context);
              });
            },
            child: Container(
                width: 30,
                height: 30,
                decoration:
                    BoxDecoration(color: primaryColor, shape: BoxShape.circle),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                )),
          ),
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

  Widget createMember() {
    return AppPrimaryButton(
        buttonText: addMemberBttnTxt,
        buttonHeight: 40,
        buttonWidth: sizeWidth * 0.45);
  }

  Widget createTeam() {
    return AppPrimaryButton(
        buttonText: addTeamBttnTxt,
        buttonHeight: 40,
        buttonWidth: sizeWidth * 0.45);
  }

  Widget teamNameField() {
    return TaskFormInput(
      placeholder: "Team Name",
      autofocus: false,
      keyboardType: "text",
      controller: _teamNameController,
      obscureText: false,
    );
  }

  // Show Dialog For Add Team
  Future addTeamDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: IntrinsicHeight(
            child: Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: whiteColor,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              addTeamTxt,
                              style: AppTextStyles.header,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              try {
                                Get.back();
                              } catch (exception) {
                                print(exception);
                              }
                            },
                            child: Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 1)),
                              child: Icon(
                                Icons.close_sharp,
                                size: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSpaces.verticalSpace10,
                      teamNameField(),
                      AppSpaces.verticalSpace30,
                      createTeam(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
