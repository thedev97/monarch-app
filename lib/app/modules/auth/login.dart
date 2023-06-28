import 'package:Monarch/app/modules/auth/send-otp-email.dart';
import 'package:get/get.dart';
import '../../controllers/auth/login.dart';
import '../../core/commons.dart';
import '../../core/values/sizes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../core/values/strings.dart';
import '../../core/utils/custom-painter.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/navigation/back_button.dart';
import '../../widgets/buttons/primary_buttons.dart';
import 'package:Monarch/app/core/values/colors.dart';
import 'package:Monarch/app/core/values/images.dart';
import 'package:Monarch/app/modules/auth/signup.dart';
import '../../widgets/forms/text_input_with _label.dart';

class Login extends StatelessWidget {
  final String? email;

  Login({Key? key, this.email}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaKey = GlobalKey<ScaffoldState>();

  LoginController loginController = Get.put(LoginController());

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
            loginContainer(),
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
    return Text(login_title,
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

  Widget forgotPasswordTxt() {
    return Align(
      alignment: Alignment.bottomRight,
      child: TextButton(
        onPressed: () => Get.to(EmailSendOTP()),
        child: Text(forgotPass_bttn,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w500,
                fontSize: 12,
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

  Widget accountTxt() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,),
      child: new Align(
        alignment: Alignment.bottomLeft,
        child: new RichText(
          text: TextSpan(
            text: exist_acc_txt,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 1.0),
                ],
                color: Colors.black),
            children: <TextSpan>[
              new TextSpan(
                recognizer: TapGestureRecognizer()
                  ..onTap = () => Get.to(() => SignUp()),
                text: signup_text,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                    shadows: [
                      Shadow(
                          color: Colors.black,
                          offset: Offset(0.0, 1.0),
                          blurRadius: 1.0),
                    ],
                    color: orange),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget subTitleTxt() {
    return RichText(
      text: TextSpan(
        text: 'Using  ',
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)),
        children: <TextSpan>[
          TextSpan(
              text: email,
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  shadows: [
                    Shadow(
                        color: Colors.black,
                        offset: Offset(0.0, 0.5),
                        blurRadius: 0.2),
                  ],
                  color: Colors.black)),
          TextSpan(
              text: " to login.",
              style: GoogleFonts.lato(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.8))),
        ],
      ),
    );
  }

  Widget loginContainer() {
    return ListView(
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
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
                                loginController.passwordController.value,
                            obscureText: !loginController.obscureText.value,
                            label: "Your Password",
                            validatorFunction: (String? val) {
                              if (val!.isEmpty == true) {
                                return passwordEmptyErrorMsg;
                              } else {
                                return null;
                              }
                            },
                            showPasswordValue: () => loginController.obscureText
                                .value = !loginController.obscureText.value,
                          ),
                        ),
                        verticalSpaceMedium,
                        Obx(
                          () => loginController.loading.value
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
                                  child: AppPrimaryButton(
                                      buttonHeight: 40,
                                      buttonWidth: sizeWidth * 0.35,
                                      buttonText: login_button,
                                      callback: () =>
                                          loginController.loginApi()),
                                ),
                        ),
                        verticalSpaceTiny,
                        forgotPasswordTxt(),
                        verticalLargeSpace,
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
        ),
        accountTxt(),
      ],
    );
  }
}
