import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/values/sizes.dart';
import 'package:flutter/material.dart';
import '../../core/values/images.dart';
import '../../core/values/strings.dart';
import '../../core/Utils/custom-painter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back_button.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../controllers/auth/change-password.dart';

class ChangePassword extends StatelessWidget {
  String email;
  ChangePassword({Key? key, required this.email}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  ChangePasswordController changePasswordController =
      Get.put(ChangePasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        key: _scaKey,
        body: SafeArea(
          child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            backgroundPainter(),
            changePasswordContainer(),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Image.asset(
                    butterfly_img,
                    height: 50,
                    width: 85,
                  ),
                )),
          ]),
        ));
  }

  Widget backgroundPainter() {
    return CustomPaint(
      painter: Painter(),
      child: Container(),
    );
  }

  Widget titleTxt() {
    return Text(changePass_title,
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

  Widget subTitleTxt() {
    return Text(changePass_subtitle,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)));
  }

  Widget changePasswordContainer() {
    return Padding(
      padding: EdgeInsets.only(
          left: 25.0, right: 25.0, top: sizeHeight * 0.18, bottom: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: ScrollPhysics(),
          child: CustomPaint(
            painter: PainterTwo(),
            child: Container(
              width: sizeWidth,
              padding: EdgeInsets.only(
                  left: 15.0, top: 40.0, right: 15.0, bottom: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    verticalSpaceMedium,
                    titleTxt(),
                    verticalSpaceSmall,
                    subTitleTxt(),
                    verticalSpaceRegular,
                    Obx(
                      () => TextFormInput(
                        placeholder: "Password",
                        keyboardType: "text",
                        controller:
                            changePasswordController.passwordController.value,
                        obscureText:
                            !changePasswordController.obscureText.value,
                        label: "Your Password",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return passwordEmptyErrorMsg;
                          } else {
                            return null;
                          }
                        },
                        showPasswordValue: () =>
                            changePasswordController.obscureText.value =
                                !changePasswordController.obscureText.value,
                      ),
                    ),
                    verticalSpaceRegular,
                    Obx(
                      () => TextFormInput(
                        placeholder: "Confirm Password",
                        keyboardType: "text",
                        controller: changePasswordController
                            .confirmPasswordController.value,
                        obscureText:
                            !changePasswordController.obscureText1.value,
                        label: "Confirm Password",
                        validatorFunction: (String? val) {
                          if (val!.isEmpty == true) {
                            return passwordEmptyErrorMsg;
                          } else {
                            return null;
                          }
                        },
                        showPasswordValue: () =>
                            changePasswordController.obscureText1.value =
                                !changePasswordController.obscureText1.value,
                      ),
                    ),
                    verticalSpaceMedium,
                    Obx(
                      () => changePasswordController.loading.value
                          ? Padding(
                              padding:
                                  EdgeInsets.only(right: sizeWidth * 0.142),
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: const SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.black,
                                    strokeWidth: 2,
                                  ),
                                ),
                              ),
                            )
                          : Align(
                              alignment: Alignment.bottomRight,
                              child: Align(
                                alignment: Alignment.bottomRight,
                                child: AppPrimaryButton(
                                  buttonHeight: 40,
                                  buttonWidth: sizeWidth * 0.35,
                                  buttonText: reset_button,
                                  callback: () => changePasswordController
                                      .changePasswordApi(email),
                                ),
                              ),
                            ),
                    ),
                    verticalSpaceMedium,
                    verticalSpaceRegular,
                    verticalSpaceRegular,
                    Align(
                      alignment: Alignment.bottomRight,
                      child: AppBackButton(
                        horizontalIcon: true,
                      ),
                    ),
                    verticalSpaceMedium,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
