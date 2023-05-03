import 'login.dart';
import 'signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/commons.dart';
import '../../core/utils/custom-painter.dart';
import '../../core/values/sizes.dart';
import '../../core/values/strings.dart';
import '../../widgets/buttons/primary_buttons.dart';
import '../../widgets/forms/text_input_with _label.dart';
import '../../widgets/navigation/back_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project_management_tool/app/core/values/colors.dart';
import 'package:project_management_tool/app/core/values/images.dart';

class EmailAddressScreen extends StatefulWidget {
  @override
  _EmailAddressScreenState createState() => _EmailAddressScreenState();
}

class _EmailAddressScreenState extends State<EmailAddressScreen> {
  TextEditingController _emailController = new TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: false,
        body: SafeArea(
          child: Stack(children: [
            Container(
              color: Colors.white,
            ),
            backgroundPainter(),
            loginContainer(),
            accountTxt(),
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
            fontSize: 25,
            shadows: [
              Shadow(
                  color: Colors.black,
                  offset: Offset(0.0, 1.0),
                  blurRadius: 1.0),
            ],
            color: Colors.black));
  }

  Widget accountTxt() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
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
    return Text(login_sub_title,
        style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 12,
            color: Colors.black.withOpacity(0.8)));
  }

  Widget loginContainer() {
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
              padding: EdgeInsets.only(left: 15.0, top: 40.0, right: 15.0, bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpaceMedium,
                  titleTxt(),
                  verticalSpaceSmall,
                  subTitleTxt(),
                  verticalSpaceRegular,
                  TextFormInput(
                    placeholder: "Email",
                    keyboardType: "text",
                    controller: _emailController,
                    obscureText: obscureText,
                    label: "Your Email",
                    validatorFunction: (String? val) {
                      if (val!.isEmpty == true) emailEmptyErrorMsg;
                    },
                  ),
                  verticalSpaceMedium,
                  Align(
                    alignment: Alignment.bottomRight,
                    child: AppPrimaryButton(
                      buttonHeight: 40,
                      buttonWidth: sizeWidth * 0.35,
                      buttonText: login_button,
                      callback: () => Get.to(() => Login(
                            email: _emailController.text,
                          )),
                    ),
                  ),
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
    );
  }
}
