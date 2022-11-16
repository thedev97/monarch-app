/*import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:project_management_tool/app/widgets/background/white-background.dart';
import '../../core/values/values.dart';
import '../../widgets/dummy/profile_dummy_img.dart';
import '../../widgets/forms/text_input_with _label.dart';

class EditProfilePage extends StatelessWidget {
  final String tabSpace = "\t\t\t";

  EditProfilePage({Key? key}) : super(key: key);

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _roleController = new TextEditingController();
  TextEditingController _aboutController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      WhiteBackground(
        color: HexColor.fromHex("#181a1f"),
        position: "topLeft",
      ),
      Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SafeArea(
              child: SingleChildScrollView(
                  child: Column(children: [
            *//* TaskezAppHeader(
              title: "$tabSpace Edit Profile",
              widget: PrimaryProgressButton(
                width: 80,
                height: 40,
                label: "Done",
                textStyle: GoogleFonts.lato(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),*//*
            SizedBox(height: 30),
            Stack(
              children: [
                ProfileDummyImg(
                    color: HexColor.fromHex("94F0F1"),
                    dummyType: ProfileDummyTypeImg.Image,
                    scale: 3.0,
                    image: "assets/man-head.png"),
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        color: AppColors.primaryAccentColor.withOpacity(0.75),
                        shape: BoxShape.circle),
                    child: Icon(FeatherIcons.camera,
                        color: Colors.white, size: 20))
              ],
            ),
            AppSpaces.verticalSpace20,
            TextFormInput(
                placeholder: "Blake Gordon",
                keyboardType: "text",
                controller: _nameController,
                obscureText: false,
                validatorFunction: (value) {},
                label: "Your Name"),
            AppSpaces.verticalSpace20,
            TextFormInput(
              placeholder: "blake@gmail.com",
              keyboardType: "text",
              controller: _emailController,
              obscureText: true,
              label: "Your Email",
              validatorFunction: (value) {},
            ),
            AppSpaces.verticalSpace20,
            TextFormInput(
                placeholder: "HikLHjD@&1?>",
                keyboardType: "text",
                controller: _passController,
                obscureText: true,
                validatorFunction: (value) {},
                label: "Your Password"),
            AppSpaces.verticalSpace20,
            TextFormInput(
                placeholder: "Visual Designer",
                keyboardType: "text",
                controller: _roleController,
                obscureText: true,
                validatorFunction: (value) {},
                label: "Role"),
            AppSpaces.verticalSpace20,
            TextFormInput(
                placeholder: "Design & Cat Person",
                keyboardType: "text",
                controller: _aboutController,
                obscureText: true,
                validatorFunction: (value) {},
                label: "About Me"),
          ]))))
    ]));
  }
}*/
